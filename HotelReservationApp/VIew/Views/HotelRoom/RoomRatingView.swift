//
//  RoomRatingView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 04/09/2023.
//

import SwiftUI

struct RoomRatingView: View {
    
    @EnvironmentObject var viewModel: RoomBookingViewViewModel
    
    var body: some View {
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
}

struct RoomRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RoomRatingView()
    }
}
