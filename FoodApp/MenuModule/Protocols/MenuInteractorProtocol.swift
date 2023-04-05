//
//  MenuInteractorProtocol.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation
import CoreData

protocol MenuInteractorProtocol {
    var creatorProducts: CreatorProductsProtocol { get set }
    var networkService: NetworkServiceProtocol { get set }
    var context: NSManagedObjectContext { get set }
    func fillStorage(completionHandler: @escaping () -> Void)
    func fillStorageFromCoreData(completionHandler: @escaping () -> Void)
    func getCommonArray() -> [Any]
    func getBannersArray() -> [BannersCellFilling]
    func getCategories() -> [String]
    func getProductsArray() -> [Product]
    func getCountOfCategoriesDictionary() -> [String: Int]
}
