//
//  HotelDetailViewViewModel.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 01/09/2023.
//

import Foundation
import Combine

final class HotelDetailViewViewModel: ObservableObject {
    
    @Published var hotelRoom: HotelRoomResponse?
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        loadHotelRoomData()
    }
    
    private func loadHotelRoomData() {
        guard let url = URL(string: "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: HotelRoomResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished")
                    break
                case .failure(let error):
                    print("Failed to load data: \(error)")
                }
            }, receiveValue: { [weak self] hotelRoom in
                self?.hotelRoom = hotelRoom
            })
            .store(in: &cancellables)
    }
}
