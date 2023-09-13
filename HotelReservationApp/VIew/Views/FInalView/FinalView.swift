//
//  FinalView.swift
//  HotelReservationApp
//
//  Created by Mr Producer on 13/09/2023.
//

import SwiftUI

struct FinalView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                Image("birthday")
                    .padding()
                Text("Ваш заказ принят в работу")
                    .font(.system(size: 28, weight: .medium))
                
                Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: MainVIew()) {
                    Text("Супер")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(18)
                        .padding(.horizontal, 12)
                }
                .frame(width: 390, height: 88)
                .background(Color.white)
                .overlay(
                    Rectangle()
                        .inset(by: -0.5)
                        .stroke(Color(red: 0.91, green: 0.91, blue: 0.93), lineWidth: 1)
                )
            }
            .multilineTextAlignment(.center)
            .padding()
            .navigationTitle("Заказ оплачен")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .bold()
                }
            )
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
