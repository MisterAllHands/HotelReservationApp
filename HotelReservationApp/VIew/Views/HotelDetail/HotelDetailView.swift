//
//  HotelDetailView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 01/09/2023.
//

import SwiftUI




struct HotelDetailView: View {
    
    @ObservedObject private var viewModel = HotelDetailViewViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var isFetchingData = false // Use @State to track data loading state
    
    var hotelAddress: String
    @State var currentIndex = 0 //Selected index for the tab image
    
    
    
    var body: some View {
            ScrollView {
                if let hotelRoom = viewModel.hotelRoom {
                    // Display the CustomTabView with hotel room data
                    RoomDetailView(room: hotelRoom.rooms[0])
                    RoomDetailView(room: hotelRoom.rooms[1])
                }
                
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .bold() // Customize the color if desired
                }
            )
            .onAppear {
                if !isFetchingData {
                    // Fetch data from the view model if not already fetching
                    viewModel.fetchDataIfNeeded()
                    isFetchingData = true // Set the flag to true when fetching starts
                }
            }
    }

    
    //MARK: NavBarTitle Calculation
    // Calculate the navigation title based on the hotel address and show letters until the first comma
    private var navigationTitle: String {
        let components = hotelAddress.split(separator: ",")
        if let firstComponent = components.first {
            return String(firstComponent)
        } else {
            return ""
        }
    }
}

struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailView(hotelAddress: "")
    }
}

