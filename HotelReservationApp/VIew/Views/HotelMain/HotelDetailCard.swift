//
//  HotelDetailCard.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//

import SwiftUI

struct HotelDetailCard: View {
    
    @EnvironmentObject var viewModel: MainViewViewModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            if let hotelRoom = viewModel.hotel {
                Text(hotelRoom.name)
                    .font(.system(size: 30, weight: .medium))
                Text(hotelRoom.adress)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color(uiColor: .systemBlue))
                    .padding(.bottom, 20)
                HStack(spacing: 10) {
                    Text("от \(hotelRoom.minimalPrice) ₽")
                        .font(.system(size: 30, weight: .semibold))
                    Text(hotelRoom.priceForIt)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top, 5)
                }
            }else {
                ProgressView()
            }
        }
        .padding(.all)
    }
}

struct HotelDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        MainVIew()
    }
}
