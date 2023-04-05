//
//  Builder.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import Foundation
import UIKit
import CoreData

class Builder {
    func createMenuViewController() -> UIViewController {
        let menuViewController = MenuViewController()
        let creatorProducts = CreatorProducts()
        let menuStorage = MenuStorage()
        let networkService = NetworkService()
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext else { return menuViewController }
        let menuInteractor = MenuInteractor(creatorProducts: creatorProducts, menuStorage: menuStorage, networkService: networkService, context: context)
        let menuPresenter = MenuPresenter(menuViewController: menuViewController, menuInteractor: menuInteractor)
        menuViewController.menuPresenter = menuPresenter
        return menuViewController
    }
}
