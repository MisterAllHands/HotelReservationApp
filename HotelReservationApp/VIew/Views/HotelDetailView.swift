//
//  HotelDetailView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 01/09/2023.
//

import SwiftUI

struct HotelDetailView: View {
    
    @ObservedObject private var viewModel = HotelDetailViewViewModel()
    
    var body: some View {
        NavigationView {
            if let hotelRoom = viewModel.hotelRoom {
                VStack {
                    Text("Room Details")
                        .font(.title)
                    
                    // Access room details from viewModel.hotelRoom here
                    ForEach(hotelRoom.rooms, id: \.id) { room in
                        Text("Room Name: \(room.name)")
                        Text("Price: \(room.price) \(room.pricePer)")
                        Text("Peculiarities: \(room.peculiarities.joined(separator: ", "))")
                        
                        // You can also load and display room images here
                        ForEach(room.imageUrls, id: \.self) { imageUrl in
                            // Load and display images using AsyncImage or any other method
                            AsyncImage(url: URL(string: imageUrl)) { phase in
                                // Handle image loading phases
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                @unknown default:
                                    Text("Error")
                                }
                            }
                        }
                    }
                }
                .padding()
            } else {
                ProgressView("Loading...")
            }
        }
    }
}

struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailView()
    }
}
