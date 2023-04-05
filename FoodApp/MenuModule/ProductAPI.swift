//
//  ProductAPI.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import Foundation

// MARK: - Product
struct ProductAPI: Codable {
    let products: [ProductElement]
    let status: String

    enum CodingKeys: String, CodingKey {
        case products = "Products"
        case status
    }
}

// MARK: - ProductElement
struct ProductElement: Codable {
    let type, title, description, price: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case type, title, description, price
        case image = "Image"
    }
}
