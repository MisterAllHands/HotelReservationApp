//
//  CustomTextField.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 07/09/2023.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    @Binding var text: String
    let placeholder: String
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            if !text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.secondary)
                    .padding(.bottom, -10)
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.1)))
            }
            
            TextField(placeholder, text: $text)
                .frame(height: 40)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

extension View {
    func customTextField(text: Binding<String>, placeholder: String) -> some View {
        self.modifier(CustomTextField(text: text, placeholder: placeholder))
    }
}
