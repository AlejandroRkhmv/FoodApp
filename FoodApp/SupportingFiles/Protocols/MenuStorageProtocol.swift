//
//  MenuStorageProtocol.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation

protocol MenuStorageProtocol {
    func commonArrays() -> [Any]
    func bannersArray() -> [BannersCellFilling]
    func fillCategories(categories: [String])
    func categoriesArray() -> [String]
    func fillProducts(products: [Product])
    func productsArray() -> [Product]
    func fillCountOfCategoriesDictionary(key: String, value: Int)
    func countOfCategoriesDictionary() -> [String: Int]
}
