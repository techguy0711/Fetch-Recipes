//
//  RecipesScreen.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import SwiftUI

struct RecipesScreen: View {
    @ObservedObject private var logic = RecipesLogic()
    
    var loadingView: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.linear)
            Text("Loading...")
        }
    }
    
    var errorView: some View {
        VStack {
            Text("☹️")
                .font(.largeTitle)
                .bold()
            Text("Something went wrong, please try again in a few minutes.")
                .font(.title)
        }
    }
    
    @ViewBuilder
    func recipesListView(_ recipes: [Recipe]) -> some View {
        List(recipes, id: \.uuid) { recipe in
            RecipeRow(recipe: recipe)
        }
    }
    
    var noRecipeView: some View {
        VStack {
            Text("🍕")
                .font(.largeTitle)
                .bold()
            Text("No Recipes available at this time")
                .font(.title)
        }
    }
    
    var body: some View {
        VStack {
            switch logic.state {
            case .initial, .loading:
                loadingView
            case .success(let recipeResponse):
                if let recipes = recipeResponse?.recipes {
                    recipesListView(recipes)
                } else {
                    noRecipeView
                }
            case .failure:
                errorView
            }
        }
        .task {
            await logic.fetchRecipes()
        }
        .refreshable {
            Task {
                await logic.fetchRecipes()
            }
        }
    }
}

#Preview {
    RecipesScreen()
}
