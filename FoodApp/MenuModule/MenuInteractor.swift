//
//  MenuInteractor.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import Foundation
import CoreData

class MenuInteractor: MenuInteractorProtocol {
    var creatorProducts: CreatorProductsProtocol
    var menuStorage: MenuStorageProtocol
    var networkService: NetworkServiceProtocol
    var context: NSManagedObjectContext
    
    init(creatorProducts: CreatorProductsProtocol, menuStorage: MenuStorageProtocol, networkService: NetworkServiceProtocol, context: NSManagedObjectContext) {
        self.creatorProducts = creatorProducts
        self.menuStorage = menuStorage
        self.networkService = networkService
        self.context = context
    }
    
    func fillStorage(completionHandler: @escaping () -> Void) {
        creatorProducts.createProducts { [weak self] products in
            guard let self = self else { return }
            DispatchQueue.global(qos: .background).async {
                self.menuStorage.fillProducts(products: products)
                self.createProductsDictionary(products: products)
                DispatchQueue.global(qos: .background).async { [weak self] in
                    guard let self = self else { return }
                    self.deleteProductsFromCoreData()
                    for product in products {
                        self.saveProductinCoreData(object: product)
                    }
                }
                completionHandler()
            }
        }
    }
    
    func fillStorageFromCoreData(completionHandler: @escaping () -> Void) {
        creatorProducts.createProductsFromCoreData(context: context) { [weak self] products in
            guard let self = self else { return }
            DispatchQueue.global(qos: .background).async {
                self.menuStorage.fillProducts(products: products)
                self.createProductsDictionary(products: products)
            }
           completionHandler()
        }
    }
    
    func getCommonArray() -> [Any] {
        return menuStorage.commonArrays()
    }
    
    func getBannersArray() -> [BannersCellFilling] {
        return menuStorage.bannersArray()
    }
    
    func getCategories() -> [String] {
        return menuStorage.categoriesArray()
    }
    
    func getProductsArray() -> [Product] {
        return menuStorage.productsArray()
    }
    
    func getCountOfCategoriesDictionary() -> [String: Int] {
        return menuStorage.countOfCategoriesDictionary()
    }
    
    // MARK: - fileprivate functions
    fileprivate func createProductsDictionary(products: [Product]) {
        var type = ""
        var count = 0
        var categories = [String]()
        for product in products {
            count += 1
            if product.type != type {
                type = product.type
                categories.append(type)
                self.menuStorage.fillCountOfCategoriesDictionary(key: type, value: count - 1)
            }
        }
        self.menuStorage.fillCategories(categories: categories)
    }
    
    fileprivate func saveProductinCoreData(object: Product) {
        let product = FoodProducts(context: context)
        product.title = object.title
        product.text = object.text
        product.price = object.price
        product.image = object.image
        product.type = object.type
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        print(product.title as Any)
    }
    
    fileprivate func deleteProductsFromCoreData() {
        let fetchRequest: NSFetchRequest<FoodProducts> = FoodProducts.fetchRequest()
        if let products = try? context.fetch(fetchRequest) {
            for product in products {
                context.delete(product)
            }
        }
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
