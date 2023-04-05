//
//  MenuPresenter.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import Foundation
import CoreData
import Network

class MenuPresenter: MenuPresenterProtocol {
    
    weak var menuViewController: MenuViewControllerProtocol?
    var menuInteractor: MenuInteractorProtocol
    var context: NSManagedObjectContext!
    var products = [Product]()
    let monitor = NWPathMonitor()
    
    required init(menuViewController: MenuViewControllerProtocol, menuInteractor: MenuInteractorProtocol) {
        self.menuInteractor = menuInteractor
        self.menuViewController = menuViewController
    }
    
    func getProductsForMenu() {
        let queue = DispatchQueue(label: "Monitor")
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            if path.status == .satisfied {
                print("connect")
                self.menuInteractor.fillStorage(completionHandler: {
                    DispatchQueue.main.async {
                        self.menuViewController?.reloadData()
                    }
                })
            } else {
                print("disconnect")
                self.menuInteractor.fillStorageFromCoreData {
                    DispatchQueue.main.async {
                        self.menuViewController?.reloadData()
                    }
                }
            }
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitor() {
        monitor.cancel()
    }
    
    func getCommonArray() -> [Any] {
        return menuInteractor.getCommonArray()
    }
    
    func getBannersArray() -> [BannersCellFilling] {
        return menuInteractor.getBannersArray()
    }
    
    func getCategories() -> [String] {
        return menuInteractor.getCategories()
    }
    
    func getProductsArray() -> [Product] {
        return menuInteractor.getProductsArray()
    }
    
    func getCountOfCategoriesDictionary() -> [String: Int] {
        return menuInteractor.getCountOfCategoriesDictionary()
    }
}
