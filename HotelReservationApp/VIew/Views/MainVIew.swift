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
//                    .overlay (
//                        HStack(spacing: 15) {
//                            ForEach(1..<5, id: \.self) { index in
//                                Capsule()
//                                    .fill(.white)
//                                    .frame(width: getIndex() == index ? 20 : 7,
//                                           height: 7)
//                            }
//                        }
//    //                        .overlay(
//    //                            Capsule()
//    //                                .fill(Color.white)
//    //                                .frame(width: 20, height: 7)
//    //                                .offset(x: getOffsetX())
//    //                            ,alignment: .leading
//    //                        )
//                        .padding(.bottom, 10)
//                        ,alignment: .bottom
//                    )
//                    RatingCardVIew()
//                    HotelDetailCard()
//                    AboutHotelView()
//                }
//                .edgesIgnoringSafeArea(.bottom)
//                .navigationTitle("Отель")
//            .navigationBarTitleDisplayMode(.inline)
//            }
//        }
//    }
//    //Getting Index...
//    func getIndex()->Int {
//        let index = Int(round(Double(offset / getWidth())))
//        return index
//    }
//    //Getting offset for Capsule Shape...
//    func getOffsetX() ->CGFloat{
//        let progress = offset / getWidth()
//        return 22 * progress
//    }
//}
//
//struct MainVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        MainVIew(images: [])
//    }
//}
//
//  MainVIew.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 31/08/2023.
//


import SwiftUI


struct MainVIew: View {
    
    @ObservedObject private var viewModel = MainViewViewModel()
    
    @State var offset: CGFloat = 0
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                TabView(selection: $offset) {
                    ForEach(viewModel.imageUrls, id: \.self) { imageUrl in
                        if let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                @unknown default:
                                    Text("Error")
                                }
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: UIScreen.main.bounds.height * 0.4) // Adjust the height as needed
                    .offset(y: -offset)
                    
                    VStack {
                        RatingCardVIew(viewModel: viewModel)
                        HotelDetailCard(viewModel: viewModel)
                        AboutHotelView(viewModel: viewModel)
                        
                    }
                }
                
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(OffsetPreferenceKey.self) { newOffset in
                    self.offset = newOffset
                }
                .navigationBarTitle("Отель")
                .navigationBarTitleDisplayMode(.inline)
                onAppear{
                    viewModel.fetchData()
                }
            }
        }
    }
}


struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct MainVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainVIew()
    }
}
