//
//  CachedImage.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import Foundation
import SwiftUI

struct CachedImage<Content: View>: View {
    let url: URL
    @ViewBuilder let content: (Image?) -> Content
    @State private var uiImage: UIImage?
    @State private var isLoading = false

    var body: some View {
        Group {
            if let uiImage = uiImage {
                content(Image(uiImage: uiImage))
            } else {
                content(nil)
                    .onAppear(perform: loadImage)
            }
        }
    }

    private func loadImage() {
        if let cachedImage = ImageCacheLogic.shared.image(for: url) {
            self.uiImage = cachedImage
            return
        }

        guard !isLoading else { return }
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { isLoading = false }
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.uiImage = image
                ImageCacheLogic.shared.save(image, for: url)
            }
        }.resume()
    }
}
