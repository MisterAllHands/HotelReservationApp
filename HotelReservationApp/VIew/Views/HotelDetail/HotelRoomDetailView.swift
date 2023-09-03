//
//  HotelRoomDetailView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 03/09/2023.
//

import SwiftUI

struct RoomDetailView: View {
    let room: Room
    @State private var currentIndex = 0
    var body: some View {
        
        CustomTabView(items: room.imageUrls.map { .image($0) }, currentIndex: $currentIndex)

        VStack(alignment: .leading, spacing: 10) {
            // Display room-specific details
            Text(room.name)
                .font(.system(size: 25, weight: .medium))
                .padding()

            AlignmentGridView(labels: room.peculiarities)

            Button {
                // Handle button action
            } label: {
                HStack {
                    Text("Подробнее о номере")
                    Image(systemName: "chevron.right")
                    Spacer()
                }
                .font(.headline)
                .foregroundColor(.blue)
                .padding(.top)
                .padding(.leading, 20)
            }

            HStack(spacing: 10) {
                Text("\(room.price) ₽")
                    .font(.system(size: 30, weight: .semibold))
                    .padding(.leading, 5)
                Text(room.pricePer)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top, 5)
            }
            .padding(.top)

            NavigationLink(destination: RoomBookingView()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: 50)
                        .padding()
                    Text("Выбрать номер")
                        .foregroundColor(.white)
                        .font(.headline)
                        .bold()
                }
            }
        }
        .padding(.leading)
    }
}
