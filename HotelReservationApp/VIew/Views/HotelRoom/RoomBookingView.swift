//
//  RoomBookingView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 03/09/2023.
//

import SwiftUI



struct RoomBookingView: View {
    
    @EnvironmentObject var viewModel: RoomBookingViewViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    
                    RoomRatingView(viewModel: _viewModel)
                    
                    if let booked = viewModel.roomBooking {
                        Text(booked.hotelName)
                            .font(.system(size: 25, weight: .semibold))
                        Button {
                            // Action
                        } label: {
                            Text(booked.hotelAdress)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color(uiColor: .systemBlue))
                                .padding(.bottom, 20)
                        }
                        Spacer()
                        
                        touristTableView(viewModel: viewModel)
                        
                       

                    }
                }
                .padding(.leading)
                .onAppear{
                    viewModel.fetchDataIfNeeded()
                }
                .navigationTitle("Бронирование")
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
            }
        }
    }
}

@ViewBuilder
private func touristTableView(viewModel: RoomBookingViewViewModel) -> some View {
    if let booked = viewModel.roomBooking {
        VStack(alignment: .leading, spacing: 10) {
            DetailRow(label: "Вылет из:", value: booked.departure)
            DetailRow(label: "Страна, город:", value: booked.arrivalCountry)
            DetailRow(label: "Даты:", value: "\(booked.tourDateStart) - \(booked.tourDateStop)")
            DetailRow(label: "Кол-во ночей:", value: "\(booked.numberOfNights) ночей")
            DetailRow(label: "Отель:", value: booked.hotelName)
            DetailRow(label: "Номер:", value: booked.room)
            DetailRow(label: "Питание:", value: booked.nutrition)
        }
        .padding(.leading)
        .padding(.trailing)
    }
}


struct RoomBookingView_Previews: PreviewProvider {
    static var previews: some View {
        RoomBookingView()
            .environmentObject(RoomBookingViewViewModel())
    }
}
