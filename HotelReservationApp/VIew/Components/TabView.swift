//
//  TabView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 02/09/2023.
//

import SwiftUI



enum CustomTabViewItem {
    case image(String)
    case room(Room) // Use your actual room object type here
}

struct CustomTabView: View {
    var items: [CustomTabViewItem]
    @Binding var currentIndex: Int

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(items.indices, id: \.self) { index in
                let item = items[index]
                switch item {
                case .image(let imageUrl):
                    if let url = URL(string: imageUrl) {
                        CachedImageView(url: url)
                            .tag(index) // Tag each tab with its index
                    }
                case .room(let room):
                    ForEach(room.imageUrls, id: \.self) { imageUrl in
                        if let url = URL(string: imageUrl) {
                            CachedImageView(url: url)
                                .tag(index) // Tag each tab with its index
                        }
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.3)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .tag(currentIndex)
        //        .overlay (
        //            HStack(spacing: 15) {
        //                ForEach(0..<items.count, id: \.self) { index in
        //                    Capsule()
        //                        .fill(index == currentIndex ? Color.black : Color.gray.opacity(0.7))
        //                        .frame(width: 8, height: 8)
        //                        .onTapGesture {
        //                            currentIndex = index
        //                        }
        //                }
        //            }
        //                .padding(.bottom, 10)
        //                .background(
        //                    RoundedRectangle(cornerRadius: 5)
        //                        .fill(.white)
        //                        .frame(width: 80 ,height: 18)
        //                        .padding(.bottom, 10)
        //                ),alignment: .bottom
        //        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(items: [], currentIndex: .constant(0))
    }
}
