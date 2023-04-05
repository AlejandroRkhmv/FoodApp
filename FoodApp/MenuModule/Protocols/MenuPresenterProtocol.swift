//
//  MenuPresenterProtocol.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation

protocol MenuPresenterProtocol: AnyObject {
    var menuInteractor: MenuInteractorProtocol { get set }
    var menuViewController: MenuViewControllerProtocol? { get set }
    init(menuViewController: MenuViewControllerProtocol, menuInteractor: MenuInteractorProtocol)
    
    func getProductsForMenu()
    func stopMonitor()
    func getCommonArray() -> [Any]
    func getBannersArray() -> [BannersCellFilling]
    func getCategories() -> [String]
    func getProductsArray() -> [Product]
    func getCountOfCategoriesDictionary() -> [String: Int]
}
