//
//  Category.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import SnapKit
import UIKit

class Category: UICollectionViewCell {
    var delegate: CategoryDelegate!
    
    var categoryButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: ColorEnum.selectedCategoryButton.rawValue)?.cgColor
        button.setTitleColor(UIColor(named: ColorEnum.selectedCategoryButton.rawValue), for: .normal)
        button.setTitleColor(UIColor(named: ColorEnum.tabBarSelected.rawValue), for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    // MARK: - init Category cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


