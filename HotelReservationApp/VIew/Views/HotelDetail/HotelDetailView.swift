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
                    CustomTabView(items: [.room((hotelRoom.rooms[0]))], currentIndex: $currentIndex)
                    // Access the `peculiarities` property for each `Room`in `hotelRoom.rooms` and flatten the arrays into a single array of labels.
                    VStack(alignment: .leading, spacing: 10) {
                        Text(hotelRoom.rooms[0].name)
                            .font(.system(size: 25, weight: .medium))
                            .padding()
                        
                        AlignmentGridView(labels: hotelRoom.rooms[0].peculiarities)
                        
                        Button {
                            //No action is needed
                        } label: {
                            HStack {
                                Text("Подробнее о номере")
                                Image(systemName: "chevron.right")
                                Spacer()
                            }
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.top)
                            .padding(.leading, 20)
                        }
                        
                        HStack(spacing: 10) {
                            Text("\(hotelRoom.rooms[0].price) ₽")
                                .font(.system(size: 30, weight: .semibold))
                                .padding(.leading, 5)
                            Text(hotelRoom.rooms[0].pricePer)
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .padding(.top, 5)
                        }.padding(.top)
                        
                        NavigationLink(destination: RoomBookingView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(width: UIScreen.main.bounds.width / 1.2, height: 50)
                                    .padding()
                                Text("Выбрать номер")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .bold()
                            }
                        }
                    }
                    .padding(.leading)
                    
                    CustomTabView(items: [.room((hotelRoom.rooms[1]))], currentIndex: $currentIndex)
                    // Access the `peculiarities` property for each `Room`in `hotelRoom.rooms` and flatten the arrays into a single array of labels.
                    VStack(alignment: .leading, spacing: 10) {
                        Text(hotelRoom.rooms[1].name)
                            .font(.system(size: 25, weight: .medium))
                            .padding()
                        
                        AlignmentGridView(labels: hotelRoom.rooms[1].peculiarities)
                        
                        Button {
                            //No action is needed
                        } label: {
                            HStack {
                                Text("Подробнее о номере")
                                Image(systemName: "chevron.right")
                                Spacer()
                            }
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.top)
                            .padding(.leading, 20)
                        }
                        
                        HStack(spacing: 10) {
                            Text("\(hotelRoom.rooms[0].price) ₽")
                                .font(.system(size: 30, weight: .semibold))
                                .padding(.leading, 5)
                            Text(hotelRoom.rooms[0].pricePer)
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .padding(.top, 5)
                        }.padding(.top)
                        
                        NavigationLink(destination: RoomBookingView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(width: UIScreen.main.bounds.width / 1.2, height: 50)
                                    .padding()
                                Text("Выбрать номер")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .bold()
                            }
                        }
                    }
                    .padding(.leading)
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

