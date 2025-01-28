//
//  RecipeRow.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var imageView: some View {
        Group {
            if let photoURLLarge = recipe.photoURLLarge.asURL {
                CachedImage(url: photoURLLarge) { image in
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .scaledToFit()
                    }
                }
            } else {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
    
    var body: some View {
        NavigationLink(destination: {
            RecipeDetailView(recipe: recipe)
        }, label: {
            LazyVStack(alignment: .leading) {
                imageView
                Text(recipe.name)
                    .font(.title)
                    .bold()
                    .accessibilityIdentifier("recipe_name")
                Text(recipe.cuisine)
                    .font(.caption)
                    .accessibilityIdentifier("recipe_cuisine")
            }
        })
    }
}
