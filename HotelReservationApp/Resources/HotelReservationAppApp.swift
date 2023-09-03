//
//  HotelReservationAppApp.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//

import SwiftUI

@main
struct HotelReservationAppApp: App {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainVIew()
                .environmentObject(viewModel)
        }
    }
}
