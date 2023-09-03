//
//  ImageCashView.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 03/09/2023.
//

import SwiftUI



import SwiftUI
import Combine

struct CachedImageView: View {
    
    @ObservedObject private var imageCache = ImageCacheViewModel.shared
    @State private var image: UIImage?
    
    let url: URL

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            ProgressView()
                .onAppear {
                    imageCache.loadImage(from: url)
                        .sink { loadedImage in
                            self.image = loadedImage
                        }
                        .store(in: &imageCache.cancellables)
                }
        }
    }
}
