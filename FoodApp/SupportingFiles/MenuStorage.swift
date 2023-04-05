//
//  MenuStorage.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import UIKit

class MenuStorage: MenuStorageProtocol {
    private var categories = [String]()
    private var products: [Product] = []
    private var countOfCategories = [String: Int]()
    private var banners: [BannersCellFilling] = [
        .init(image: UIImage(named: "saleBuuner")!, isBannerVisible: true),
        .init(image: UIImage(named: "priceBunner")!, isBannerVisible: true)
    ]
    
    func commonArrays() -> [Any] {
        let commonArray: [Any] = [banners, products]
        return commonArray
    }
    
    func bannersArray() -> [BannersCellFilling] {
        return banners
    }
    
    func fillCategories(categories: [String]) {
        self.categories = categories
    }
    
    func categoriesArray() -> [String] {
        return categories
    }
    
    func fillProducts(products: [Product]) {
        self.products = products
    }
    
    func productsArray() -> [Product] {
        return products
    }
    
    func fillCountOfCategoriesDictionary(key: String, value: Int) {
        countOfCategories[key] = value
    }
    
    func countOfCategoriesDictionary() -> [String: Int] {
        return countOfCategories
    }
}
