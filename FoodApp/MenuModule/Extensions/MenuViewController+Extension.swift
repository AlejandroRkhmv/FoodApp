//
//  MenuViewController+Extension.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import SnapKit
import UIKit
import CoreData

// MARK: - extension for FeedViewController
extension MenuViewController {
    // MARK: - START
    func start() {
        navigationItem.leftBarButtonItems = cityLeftBarButtonItems()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backgroundColor = UIColor(named: ColorEnum.background.rawValue)
        
        // MARK: - getProducts
        menuPresenter.getProductsForMenu()
        
        tableView.backgroundColor = UIColor(named: ColorEnum.background.rawValue)
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(BannerCell.self, forCellReuseIdentifier: String(describing: BannerCell.self))
        tableView.register(ProductCell.self, forCellReuseIdentifier: String(describing: ProductCell.self))
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func cityLeftBarButtonItems() -> [UIBarButtonItem] {
        let cityNameItem = UIBarButtonItem(customView: cityView.getCityLabel())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "dropDownIcon"), target: self, action: nil, menu: makeDropDownMenu())
        dropDownButtonItem.customView?.frame = CGRect(x: 0, y: 0, width: 14, height: 8)
        return [cityNameItem, dropDownButtonItem]
    }
    
    
    func makeDropDownMenu() -> UIMenu {
        let city1 = UIAction(title: City.moscow.rawValue) { [weak self] _ in
            guard let self = self else { return }
            self.cityView.changeCityNameLabel(text: City.moscow.rawValue)
        }
        let city2 = UIAction(title: City.spb.rawValue) { [weak self] _ in
            guard let self = self else { return }
            self.cityView.changeCityNameLabel(text: City.spb.rawValue)
        }
        let city3 = UIAction(title: City.rostov.rawValue) { [weak self] _ in
            guard let self = self else { return }
            self.cityView.changeCityNameLabel(text: City.rostov.rawValue)
        }
        let city4 = UIAction(title: City.krasnodar.rawValue) { [weak self] _ in
            guard let self = self else { return }
            self.cityView.changeCityNameLabel(text: City.krasnodar.rawValue)
        }
        let city5 = UIAction(title: City.ufa.rawValue) { [weak self] _ in
            guard let self = self else { return }
            self.cityView.changeCityNameLabel(text: City.ufa.rawValue)
        }
        let city6 = UIAction(title: City.chelyabinsk.rawValue) { [weak self] _ in
            guard let self = self else { return }
            self.cityView.changeCityNameLabel(text: City.chelyabinsk.rawValue)
        }
        return UIMenu(title: "", children: [city1 ,city2, city3, city4, city5, city6])
    }
    
    func initializationFC() {
        let fetchRequest: NSFetchRequest<FoodProducts> = FoodProducts.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(FoodProducts.type), ascending: true)
        fetchRequest.fetchLimit = 15
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                           managedObjectContext: menuPresenter.menuInteractor.context,
                                                           sectionNameKeyPath: nil,
                                                           cacheName: nil)
        fetchResultController.delegate = self
        do {
            try fetchResultController.performFetch()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuPresenter.getCommonArray().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return (menuPresenter.getCommonArray()[section] as? [Product])?.count ?? 0
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1: return 80
        default: return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let header = CategoryView()
            header.configure(with: menuPresenter.getCategories())
            header.collectionView.reloadData()
            header.delegate = self
            header.backgroundColor = UIColor(named: ColorEnum.background.rawValue)
            return header
        default:
            break
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let bannerCell = tableView.dequeueReusableCell(withIdentifier: String(describing: BannerCell.self), for: indexPath) as? BannerCell {
                bannerCell.backgroundColor = UIColor(named: ColorEnum.background.rawValue)
                bannerCell.configure(with: menuPresenter.getBannersArray())
                return bannerCell
            }
        case 1:
            if let productCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell.self), for: indexPath) as? ProductCell {
                productCell.delegate = self
                
                    productCell.configure(with: menuPresenter.getProductsArray()[indexPath.row])
                
                return productCell
            }
        default: break
        }
        return UITableViewCell()
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 112
        case 1: return 200
        default: break
        }
        return 0
    }
}

extension MenuViewController: ProductCellDelegate {
    func loadImage(from urlString: String, completionHandler: @escaping (Data?) -> Void) {
        menuPresenter.menuInteractor.networkService.performRequest(with: urlString, completion: completionHandler)
    }
}

extension MenuViewController: MenuViewControllerProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

extension MenuViewController: CategoryViewDelegate {
    func scrollTo(row: Int) {
        tableView.scrollToRow(at: IndexPath(row: row, section: 1), at: .top, animated: true)
    }
}

extension MenuViewController: NSFetchedResultsControllerDelegate {}
