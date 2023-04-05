//
//  CategoryViewDelegate.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation

protocol CategoryViewDelegate {
    var menuPresenter: MenuPresenterProtocol! { get set }
    func scrollTo(row: Int)
}
