//
//  Extencions.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//

import SwiftUI

extension View {
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
