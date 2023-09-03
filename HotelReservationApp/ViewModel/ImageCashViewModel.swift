import SwiftUI
import Combine

 class ImageCacheViewModel: ObservableObject {
    
    static let shared = ImageCacheViewModel()
    private let urlCache = URLCache.shared

    // Change the access level to public to make it accessable from ImageCashView
    public var cancellables: Set<AnyCancellable> = []

     // Function to load an image from a given URL
    func loadImage(from url: URL) -> AnyPublisher<UIImage?, Never> {
        if let cachedResponse = urlCache.cachedResponse(for: URLRequest(url: url)), // Check if the image is cached
           let image = UIImage(data: cachedResponse.data) {
            print("Using cached image for URL: \(url)")
            return Just(image)
                .eraseToAnyPublisher()
        }
        
        print("Downloading image for URL: \(url)") // Add this line
        
        // If not cached, download and cache the image
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { data, _ in UIImage(data: data) } // Map the data to a UIImage

            .replaceError(with: nil)
            .handleEvents(receiveOutput: { [weak self] image in
                if let image = image {
                    let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
                    let cachedResponse = CachedURLResponse(response: response, data: image.pngData()!)
                    self?.urlCache.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
                    print("Downloaded and cached image for URL: \(url)")

                }
            })
            .eraseToAnyPublisher()
    }
}
