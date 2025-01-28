//
//  NetworkManager.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import Foundation

protocol NetworkUseCases {
    func fetchRecipes() async throws -> RecipeResponse?
}

class NetworkManager: NetworkUseCases {
    func fetchRecipes() async throws -> RecipeResponse? {
        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let recipes = try decoder.decode(RecipeResponse?.self, from: data)
        return recipes
    }
}
