//
//  RecipeDetailView.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var body: some View {
        NavigationView {
            if let youtubeURL = recipe.youtubeURL {
                YouTubeView(url: youtubeURL)
            }
        }.navigationTitle(recipe.name)
    }
}
