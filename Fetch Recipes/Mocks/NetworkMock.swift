//
//  NetworkMock.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

class NetworkMock: NetworkUseCases {
    
    func fetchRecipes() async throws -> RecipeResponse? {
        return RecipeResponse(recipes: [
            Recipe(cuisine: "Hispanic", name: "Chicken and Rice", photoURLLarge: "https://somelargephoto.com", photoURLSmall: "https://somesmallphoto.com", sourceURL: "https://sourceURL.com", uuid: "1", youtubeURL: "youtube.com/somevideo"),
            Recipe(cuisine: "American", name: "Ham Burger", photoURLLarge: "https://somelargephoto.com", photoURLSmall: "https://somesmallphoto.com", sourceURL: "https://sourceURL.com", uuid: "1", youtubeURL: "youtube.com/somevideo"),
            Recipe(cuisine: "Asian", name: "California Roll", photoURLLarge: "https://somelargephoto.com", photoURLSmall: "https://somesmallphoto.com", sourceURL: "https://sourceURL.com", uuid: "1", youtubeURL: "youtube.com/somevideo")
        ])
    }
}
