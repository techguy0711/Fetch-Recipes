//
//  NetworkManager.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import Foundation

// MARK: - RecipeResponse
struct RecipeResponse: Codable, Equatable {
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe: Codable, Equatable {
    let cuisine, name: String
    let photoURLLarge, photoURLSmall: String
    let sourceURL: String?
    let uuid: String
    let youtubeURL: String?

    enum CodingKeys: String, CodingKey {
        case cuisine, name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case uuid
        case youtubeURL = "youtube_url"
    }
}
