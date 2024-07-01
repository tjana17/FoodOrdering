//
//  RecommendedItems.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/20/24.
//

import Foundation

struct RecommendedItems {
    let name: String
    let price: String
    let rating: String
    let itemImage: String
}

// MARK: - ProductsList
struct ProductsList: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let name, image, price: String
    let rating: Double
    let reviews, description: String
    let categoryID: Int
    let categoryName: String
    let isRecommended, isFavorite: Bool
}
