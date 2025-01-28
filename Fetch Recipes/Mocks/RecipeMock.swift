//
//  RecipeMock.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//
import Foundation
import Combine

class RecipeMock: RecipesUseCase, ObservableObject {
    @Published var state: RecipeState = .initial
    var network:NetworkUseCases = NetworkMock()
    var didFetchRecipes:Bool = false
    
    
    func fetchRecipes() async {
        DispatchQueue.main.async {
            self.state = .loading
        }
        didFetchRecipes = true
        do {
            let recipes = try await network.fetchRecipes()
            DispatchQueue.main.async {
                self.state = .success(recipes)
            }
        } catch {
            DispatchQueue.main.async {
                self.state = .failure(error)
            }
        }
    }
}
