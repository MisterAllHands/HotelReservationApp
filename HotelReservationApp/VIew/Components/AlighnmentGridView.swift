//
//  AlighnmentGridView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 01/09/2023.
//

import SwiftUI

struct AlignmentGridView: View {
    
    let labels: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            let chunkedLabels = labels.chunked(into: 2) // Split labels into pairs

            ForEach(chunkedLabels, id: \.self) { pair in
                HStack(spacing: 8) {
                    ForEach(pair, id: \.self) { label in
                        Text(label)
                            .font(.caption)
                            .bold()
                            .foregroundColor(.secondary)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(
                                GeometryReader(content: { geomtery in
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.secondary.opacity(0.3))
                                        .frame(width: geomtery.size.width)
                                })
                            )
                    }
                }
            }
        }
    }
}
