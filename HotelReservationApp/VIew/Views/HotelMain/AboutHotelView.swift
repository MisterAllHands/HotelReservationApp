//
//  AboutHotelView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//

import SwiftUI

struct AboutHotelView: View {
    
    @EnvironmentObject var viewModel: MainViewViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20, content: {
                    Text("Об Отеле")
                        .font(.system(size: 25, weight: .medium))
                if let hotel = viewModel.hotel {
                    
                    AlignmentGridView(labels: hotel.aboutTheHotel.peculiarities)
                    
                    Text(hotel.name)
                        .font(.body)
                    
                    NavigationLink(destination: ConditionsView()) {
                        NavigationCardView(imageName: "person.fill", mainText: "Удобство", secondaryText: "Самое необходимое")
                    }
                    NavigationLink(destination: InclusionsView()) {
                        NavigationCardView(imageName: "person.fill", mainText: "Что влючено", secondaryText: "Самое необходимое")
                    }
                    NavigationLink(destination: NonInclusionView()) {
                        NavigationCardView(imageName: "person.fill", mainText: "Что не включено", secondaryText: "Самое необходимое")
                    }
                    NavigationLink(destination: HotelDetailView(hotelAddress: hotel.adress).navigationBarBackButtonHidden()){
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                                .frame(width: UIScreen.main.bounds.width / 1.2, height: 50)
                                .padding(.leading)
                            Text("К выбору номера")
                                .foregroundColor(.white)
                                .font(.headline)
                                .bold()
                        }
                    }
                }
            })
            .padding(.all)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct AboutHotelView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainVIew()
    }
}

