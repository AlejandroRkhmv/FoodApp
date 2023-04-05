//
//  MainViewController.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import UIKit
import SnapKit
import CoreData

class MenuViewController: UIViewController {
    var menuPresenter: MenuPresenterProtocol!
    var fetchResultController: NSFetchedResultsController<FoodProducts>!
    let cityView = CityView()
    let tableView = UITableView()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = UITabBarItem(title: "Меню", image: UIImage(named: "menu"), selectedImage: nil)
        self.tabBarItem = menu
        start()
        initializationFC()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        menuPresenter.stopMonitor()
    }
}
