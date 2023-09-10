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
    @State private var phoneNumber = ""

    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer()
                        if let booked = viewModel.roomBooking {
                            RoomRatingView(rating: booked.horating, ratingName: booked.ratingName)
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
                        }
                    }
                    .padding(.leading)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding(.top)
                    )
                    
                    //MARK: Tourist Table Info

                    Spacer()
                        .frame(height: 25)
                    
                    touristTableView(viewModel: viewModel)
                    
                    //MARK: Number & Email Field
                    
                    Spacer()
                        .frame(height: 50)
                        NumberPhoneMaskVIew()
                    
                    //MARK: Tourist Section
                    
                    
                }
                .onAppear {
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
                            .bold()
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
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .frame(maxWidth: .infinity, minHeight: 300)
                .padding(.top)
        )

    }
}

struct RoomBookingView_Previews: PreviewProvider {
    static var previews: some View {
        RoomBookingView()
    }
}


