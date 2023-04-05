//
//  CreatorProducts.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import Foundation
import CoreData

class CreatorProducts: CreatorProductsProtocol {
    var dataFetcher: DataFetcherServiceProtocol
    init(dataFetcher: DataFetcherServiceProtocol = DataFetcherService()) {
        self.dataFetcher = dataFetcher
    }
    
    func createProducts(completionHandler: @escaping ([Product]) -> Void) {
        var products = [Product]()
        dataFetcher.fetchProductsAPI { productAPI in
            guard let productAPI = productAPI else { return }
            for element in productAPI.products {
                let product = Product(productElement: element)
                products.append(product)
            }
            completionHandler(products)
        }
    }
    
    func createProductsFromCoreData(context: NSManagedObjectContext, completionHandler: @escaping ([Product]) -> Void) {
        var products = [Product]()
        let context = context
        let fetchRequest: NSFetchRequest<FoodProducts> = FoodProducts.fetchRequest()
        do {
            let productFromCoreData = try context.fetch(fetchRequest)
            for productCD in productFromCoreData {
                let product = Product(product: productCD)
                products.append(product)
            }
            completionHandler(products)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}


