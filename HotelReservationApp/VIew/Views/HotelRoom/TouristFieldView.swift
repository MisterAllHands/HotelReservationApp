//
//  TouristFieldView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 07/09/2023.
//

import SwiftUI

struct TouristFieldView: View {
    
    @State private var isCollapsed = true
    @State private var name = ""
    @State private var surname = ""
    @State private var dateOfBirth = ""
    @State private var passportNumber = ""
    @State private var citizenship = ""
    @State private var passportExpirationDate = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Collapsibble {
                Text("Первый турист")
                    .font(.system(size: 30, weight: .bold))
            } content: {
                VStack {
                    TextField("Имя", text: $name)
                        .customTextField(text: $name, placeholder: "Имя")
                    TextField("Фамилия", text: $surname)
                        .customTextField(text: $surname, placeholder: "Фамилия")
                    //here should be a date picker so a user can select year month and date but i have not implemented that fwauture
                    TextField("Дата рождения", text: $dateOfBirth)
                        .customTextField(text: $dateOfBirth, placeholder: "Дата рождени")
                    //here should be a picker with all coutryies names so user can choose what nationality they are from
                    TextField("Гражданство", text: $citizenship)
                        .customTextField(text: $citizenship, placeholder: "Гражданство")
                    
                    TextField("Номер загранпаспорта", text: $passportNumber)
                        .customTextField(text: $passportNumber, placeholder: "Номер загранпаспорта")
                    //here as well a datepicker but it should be in a way that user can set passport exparation date (12.12.23 - 13.07.2028)
                    TextField("Cрок действия загранпаспорта", text: $passportExpirationDate)
                        .customTextField(text: $passportExpirationDate, placeholder: "Cрок действия загранпаспорта")
                }
            }
            .padding()
        }
    }
}

struct Collapsibble<Content: View>: View {
    @State var lable: () -> Text
    @State var content: () -> Content
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack {
            Button(action: {self.collapsed.toggle() },label: {
                HStack {
                    self.lable()
                    Spacer()
                    Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                        .font(.system(size: 27, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)
                }
                .padding(.bottom, 1)
            })
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeInOut(duration: 0.2))
            .transition(.slide)
        }
    }
}

struct TouristFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TouristFieldView()
    }
}
