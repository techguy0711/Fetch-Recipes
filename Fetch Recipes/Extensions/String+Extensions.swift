//
//  String+Extensions.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//

import Foundation

extension String {
    ///Convert String into URL for convenience
    var asURL: URL? {
        return URL(string: self)
    }
}
