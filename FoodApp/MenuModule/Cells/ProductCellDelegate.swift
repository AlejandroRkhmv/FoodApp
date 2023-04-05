//
//  ProductCellDelegate.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation

protocol ProductCellDelegate {
    func loadImage(from urlString: String, completionHandler: @escaping (Data?) -> Void)
}
