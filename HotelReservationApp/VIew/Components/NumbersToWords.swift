//
//  NumbersToWords.swift
//  HotelReservationApp
//
//  Created by Mr Producer on 13/09/2023.
//

import Foundation

func numberToRussianOrdinal(_ number: Int) -> String {
        let russianOrdinals = ["первый", "второй", "третий", "четвёртый", "пятый", "шестой", "седьмой", "восьмой", "девятый", "десятый"] // Add more if needed
        
        if number >= 1 && number <= russianOrdinals.count {
            return "\(russianOrdinals[number - 1]) турист"
        }
        
        return "\(number) турист"
}
