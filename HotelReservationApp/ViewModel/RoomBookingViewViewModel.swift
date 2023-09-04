//
//  RoomBookingViewViewModel.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 03/09/2023.
//

import Foundation
import Combine

class RoomBookingViewViewModel: ObservableObject {
    
    @Published var roomBooking: RoomBooking?
    private var hasFetchedData = false // property to track data fetch status

    private var cancellables: Set<AnyCancellable> = []
    
    func fetchDataIfNeeded() {
            guard !hasFetchedData else { return } // Only fetch data if it hasn't been fetched
            fetchData()
        }
    
    func fetchData() {
        //API endpoint
        guard let url = URL(string: "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: RoomBooking.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            print("data received")
                            break
                        case .failure(let error):
                            print("Error decoding JSON: \(error)")
                        }
                    }, receiveValue: { [weak self] decodedData in
                        self?.roomBooking = decodedData
                    })
                    .store(in: &cancellables)
    }
}
