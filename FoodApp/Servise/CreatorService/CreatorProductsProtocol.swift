//
//  CreatorProductsProtocol.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation
import CoreData

protocol CreatorProductsProtocol {
    var dataFetcher: DataFetcherServiceProtocol { get set }
    func createProducts(completionHandler: @escaping ([Product]) -> Void)
    func createProductsFromCoreData(context: NSManagedObjectContext, completionHandler: @escaping ([Product]) -> Void)
}
