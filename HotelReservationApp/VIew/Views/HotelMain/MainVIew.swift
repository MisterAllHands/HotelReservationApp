////
////  MainVIew.swift
////  HotelReservationApp
////
////  Created by TTGMOTSF on 31/08/2023.
////
//
//import SwiftUI
//
//struct MainVIew: View {
//
//    @State var offset: CGFloat = 0
//    var images: [String] = ["main","main","main"]
//
//    var body: some View {
//        NavigationView {
//            ScrollViewReader { proxy in
//                ScrollView(.init()){
//                    TabView(selection: $offset){
//                        ForEach(0..<images.count, id: \.self) { index in
//                                Image(images[index])
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .tag(index)
//                                    .overlay (
//                                        GeometryReader{proxy -> Image in
//                                            let minX = proxy.frame(in: .global).minX
//                                            DispatchQueue.main.async {
//                                                withAnimation(.default){
//                                                    self.offset = -minX
//                                                }
//                                            }
//                                            return Image("")
//                                        }
//                                        .frame(width: 0, height: 0)
//                                        ,alignment: .leading
//                                    )
//                        }
//                    }
//                    .tabViewStyle(.page(indexDisplayMode: .never))
//
//                    RatingCardVIew()
//                    HotelDetailCard()
//                    AboutHotelView()
//                }
//                .edgesIgnoringSafeArea(.bottom)
//                .navigationTitle("Отель")
//            .navigationBarTitleDisplayMode(.inline)
//            }
//        }

import SwiftUI


import SwiftUI

struct MainVIew: View {
    
    @EnvironmentObject var viewModel: MainViewViewModel
    @State var currentIndex = 0

    var body: some View {
        NavigationView {
                ScrollView {
                    CustomTabView(items: viewModel.imageUrls.map { .image($0) }, currentIndex: $currentIndex)
                    VStack {
                            RatingCardVIew(viewModel: _viewModel)
                            HotelDetailCard(viewModel: _viewModel)
                            AboutHotelView(viewModel: _viewModel)
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
