//
//  Room.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//


// MARK: - Welcome
struct HotelRoomResponse: Codable {
    let rooms: [Room]
}

struct Room: Codable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
