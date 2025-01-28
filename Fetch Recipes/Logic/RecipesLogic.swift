//
//  RecipesLogic.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import Foundation
import Combine

class RecipesLogic: RecipesUseCase, ObservableObject {
    let network: NetworkUseCases
    @Published var state: RecipeState = .initial
    
    init(network: NetworkUseCases = NetworkManager()) {
        self.network = network
    }
    
    func fetchRecipes() async {
        DispatchQueue.main.async {
            self.state = .loading
        }
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
