//
//  Product.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation

class Product: Codable {
    let type: String
    let title: String
    let text: String
    let price: String
    let image: String
    
    init(productElement: ProductElement) {
        self.type = productElement.type
        self.title = productElement.title
        self.text = productElement.description
        self.price = productElement.price
        self.image = productElement.image
    }
    
    init(product: FoodProducts) {
        self.type = product.type ?? ""
        self.title = product.title ?? ""
        self.text = product.text ?? ""
        self.price = product.price ?? ""
        self.image = product.image ?? ""
    }
}
