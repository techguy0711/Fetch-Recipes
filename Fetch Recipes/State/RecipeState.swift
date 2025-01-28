//
//  RecipeState.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import Foundation

enum RecipeState: Equatable {
    case initial
    case success(RecipeResponse?)
    case loading
    case failure(Error)

    // Custom Equatable implementation for failure since `Error` doesn't conform to `Equatable`
    static func == (lhs: RecipeState, rhs: RecipeState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (.loading, .loading):
            return true
        case (.success(let lhsResponse), .success(let rhsResponse)):
            return lhsResponse == rhsResponse
        case (.failure(let lhsError), .failure(let rhsError)):
            return (lhsError as NSError) == (rhsError as NSError)
        default:
            return false
        }
    }
}
