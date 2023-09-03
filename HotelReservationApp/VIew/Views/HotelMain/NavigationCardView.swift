//
//  NavigationCardView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//

import SwiftUI



struct NavigationCardView: View {
    let imageName: String
    let mainText: String
    let secondaryText: String
    
    var body: some View {
       
        HStack {
            Image(systemName: imageName)
                .font(.title)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(mainText)
                    .font(.system(size: 20, weight: .medium))
                    .tint(.black)
                Text(secondaryText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding()
        }
    }
}
struct NavigationCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainVIew()
    }
}
