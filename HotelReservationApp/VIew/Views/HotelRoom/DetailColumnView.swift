//
//  DetailColumnView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 04/09/2023.
//

import SwiftUI

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
                .frame(width: 150, alignment: .leading) // Adjust the width as needed
                .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
            Text(value)
        }
        .font(.headline)
    }
}
