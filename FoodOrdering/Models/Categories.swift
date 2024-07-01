//
//  Categories.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/20/24.
//

import Foundation

struct Categories: Codable {
    let category: [CategoryItem]
}

struct CategoryItem: Codable {
    let id: Int
    let name: String
    let image: String
}
