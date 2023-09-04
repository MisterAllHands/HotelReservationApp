//
//  RoomBookingView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 03/09/2023.
//

import SwiftUI

struct RoomBookingView: View {
    
    @ObservedObject var viewModel = RoomBookingViewViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    
                    if let booked = viewModel.roomBooking {
                        ratingView(viewModel: viewModel)
                        Text(booked.hotelName)
                            .font(.system(size: 25, weight: .semibold))
                        Button {
                            //Action
                        } label: {
                            Text(booked.hotelAdress)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color(uiColor: .systemBlue))
                                .padding(.bottom, 20)
                        }
                        Spacer()
                        
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
private func ratingView(viewModel: RoomBookingViewViewModel)-> some View {
    if let booked = viewModel.roomBooking {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.orange.opacity(0.2))
            .frame(width: UIScreen.main.bounds.width / 1.8, height: 35)
            .overlay(
                HStack(spacing: 5, content: {
                    Image(systemName: "star.fill")
                        .font(.system(size: 20))
                    
                    Text(String(booked.horating))
                        .font(.system(size: 20, weight: .semibold))
                    Text(booked.ratingName)
                        .font(.system(size: 20, weight: .semibold))
                    
                })
                .foregroundColor(.orange.opacity(0.8))
                ,alignment: .leading
            )
    }
}



struct RoomBookingView_Previews: PreviewProvider {
    static var previews: some View {
        RoomBookingView()
    }
}
