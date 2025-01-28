//
//  Fetch_RecipesTests.swift
//  Fetch RecipesTests
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import XCTest
@testable import Fetch_Recipes

final class Fetch_RecipesTests: XCTestCase {
    var mock: RecipeMock?
    override func setUpWithError() throws {
        mock = RecipeMock()
    }

    override func tearDownWithError() throws {
        mock = nil
    }

    func testFetchRecipesIfFetchNotCalled() async {
        XCTAssertTrue(mock?.state == .initial)
    }
    
    func testFetchRecipesCorrectResponse() async {
        XCTAssertTrue(mock?.state == .initial)
        await mock?.fetchRecipes()
        let expectedResponse = RecipeResponse(recipes: [
                        Recipe(cuisine: "Hispanic", name: "Chicken and Rice", photoURLLarge: "https://somelargephoto.com", photoURLSmall: "https://somesmallphoto.com", sourceURL: "https://sourceURL.com", uuid: "1", youtubeURL: "youtube.com/somevideo"),
                        Recipe(cuisine: "American", name: "Ham Burger", photoURLLarge: "https://somelargephoto.com", photoURLSmall: "https://somesmallphoto.com", sourceURL: "https://sourceURL.com", uuid: "1", youtubeURL: "youtube.com/somevideo"),
                        Recipe(cuisine: "Asian", name: "California Roll", photoURLLarge: "https://somelargephoto.com", photoURLSmall: "https://somesmallphoto.com", sourceURL: "https://sourceURL.com", uuid: "1", youtubeURL: "youtube.com/somevideo")
                    ])
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.mock?.state == .success(expectedResponse))
        }
    }
}
