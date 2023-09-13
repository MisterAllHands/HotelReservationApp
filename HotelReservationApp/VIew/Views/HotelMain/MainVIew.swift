//
//  MainVIew.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//



import SwiftUI

struct MainVIew: View {
    
    @EnvironmentObject var viewModel: MainViewViewModel
    @State var currentIndex = 0

    var body: some View {
        NavigationView {
                ScrollView {
                    CustomTabView(items: viewModel.imageUrls.map { .image($0) }, currentIndex: $currentIndex)
                    VStack {
                        if let hotel = viewModel.hotel{
                            RatingCardVIew(rating: hotel.rating, ratingName: hotel.ratingName)
                            HotelDetailCard(viewModel: _viewModel)
                            AboutHotelView(viewModel: _viewModel)
                        }
                    }
                }
                .navigationBarTitle("Отель")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear{
                    // Fetch data from the view model if not already fetching
                    viewModel.fetchDataIfNeeded()
                }
        }
    }
}

struct MainVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainVIew()
            .environmentObject(MainViewViewModel())
    }
}
