//
//  AboutViewViewModel.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 01/09/2023.
//

import Foundation
import Combine

class MainViewViewModel: ObservableObject {
    
    @Published var hotel: Hotel?
    @Published var imageUrls: [String] = []
    private var hasFetchedData = false // property to track data fetch status

    private var cancellables: Set<AnyCancellable> = []
    
    func fetchDataIfNeeded() {
            guard !hasFetchedData else { return } // Only fetch data if it hasn't been fetched
            fetchData()
        }
    
    func fetchData() {
        //API endpoint
        guard let url = URL(string: "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: Hotel.self, decoder: JSONDecoder())
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
                        self?.hotel = decodedData
                        self?.imageUrls = decodedData.imageUrls
                    })
                    .store(in: &cancellables)
    }
}
