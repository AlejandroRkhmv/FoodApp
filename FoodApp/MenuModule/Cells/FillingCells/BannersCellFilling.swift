//
//  BannersCellFilling.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import UIKit

class BannersCellFilling {
    let image: UIImage
    let isBannerVisible: Bool
    
    init(image: UIImage, isBannerVisible: Bool) {
        self.image = image
        self.isBannerVisible = isBannerVisible
    }
}

typealias BannersCells = [BannersCellFilling]
