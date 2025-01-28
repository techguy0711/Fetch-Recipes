//
//  ImageCache.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//


import SwiftUI
import Combine
import CryptoKit

class ImageCacheLogic {
    static let shared = ImageCacheLogic()
    private let cache = NSCache<NSURL, UIImage>()
    private let fileManager = FileManager.default
    private let cacheDirectory: URL
    
    init() {
        cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    }
    
    func image(for url: URL) -> UIImage? {
        if let cachedImage = cache.object(forKey: url as NSURL) {
            return cachedImage
        }
        let filePath = cacheDirectory.appendingPathComponent(makeFileName(from: url))
        if let imageData = try? Data(contentsOf: filePath),
           let image = UIImage(data: imageData) {
            cache.setObject(image, forKey: url as NSURL)
            return image
        }
        return nil
    }
    
    func save(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
        let filePath = cacheDirectory.appendingPathComponent(makeFileName(from: url))
        if let imageData = image.pngData() {
            try? imageData.write(to: filePath)
        }
    }
    
    private func makeFileName(from url: URL) -> String {
        let hashedName = SHA256.hash(data: Data(url.absoluteString.utf8))
        return hashedName.map { String(format: "%02x", $0) }.joined()
    }
}
