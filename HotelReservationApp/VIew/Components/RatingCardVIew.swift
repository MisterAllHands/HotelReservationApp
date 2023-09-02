//
//  RatingCardVIew.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//

import SwiftUI

struct RatingCardVIew: View {
    
    @StateObject var viewModel: MainViewViewModel

    var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.opacity(0.2))
                .frame(width: UIScreen.main.bounds.width / 1.8, height: 40)
                .padding(.trailing, 100)
                .overlay(
                    HStack(spacing: 5, content: {
                        Image(systemName: "star.fill")
                            .font(.headline)
                        if let hotelRoom = viewModel.hotel {
                            Text(String(hotelRoom.rating))
                                .font(.system(size: 20, weight: .medium))
                            Text(hotelRoom.ratingName)
                                .font(.system(size: 20, weight: .medium))
                        }
                    })
                    .padding(.leading)
                    .foregroundColor(.orange.opacity(0.8))
                    ,alignment: .leading
            )
    }
}

struct RatingCardVIew_Previews: PreviewProvider {
    static var previews: some View {
       MainVIew()
    }
}
