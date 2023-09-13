//
//  TripExpensesView.swift
//  HotelReservationApp
//
//  Created by Mr Producer on 13/09/2023.
//

import SwiftUI

struct TripExpensesView: View {
    
    var tourPrice: Int
    var fuelPrice: Int
    var serviceCharge: Int
    var total: Int {
        return tourPrice + fuelPrice + serviceCharge
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
                HStack {
                    Text("Тур")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    
                    Spacer()
                    
                    Text("\(tourPrice)₽")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(.black)
                }
                
                HStack {
                    Text("Топливный сбор")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    
                    Spacer()
                    
                    Text("\(fuelPrice) ₽")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(.black)
                }
                
                
                HStack {
                    Text("Сервисный сбор")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    
                    Spacer()
                    
                    Text("\(serviceCharge) ₽")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(.black)
                }
                
                
                HStack {
                    Text("К оплате")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    
                    Spacer()
                    
                    Text("\(total) ₽")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(.blue)
               }
        }
        .padding(16)
        .background(.white)
        .cornerRadius(12)
        
        TotalButton(destination: FinalView(), label: "Оплатить \(total) ₽")
    }
}

struct TripExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        RoomBookingView()
    }
}
