//
//  CategoryDelegate.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation

protocol CategoryDelegate {
    var delegate: CategoryViewDelegate! { get set }
    var categories: [String] { get set }
    func send(row: Int)
    func onCategoryActive(tag: Int)
}
