//
//  RatingCardVIew.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//

import SwiftUI

struct RatingCardVIew: View {
    
    var rating: Int
    var ratingName: String
    
    var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.opacity(0.2))
                .frame(width: UIScreen.main.bounds.width / 1.8, height: 35)
        
                .overlay(
                    HStack(spacing: 5, content: {
                        Image(systemName: "star.fill")
                            .font(.system(size: 20))
                       
                            Text(String(rating))
                                    .font(.system(size: 20, weight: .semibold))
                            Text(ratingName)
                                    .font(.system(size: 20, weight: .semibold))
                        
                    })
                    .padding(.leading)
                    .foregroundColor(.orange.opacity(0.8))
                    ,alignment: .leading
            )
                .padding(.leading, -150)
                .padding(.top,15)
    }
}

struct RatingCardVIew_Previews: PreviewProvider {
    static var previews: some View {
        RoomBookingView()
    }
}
