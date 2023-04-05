//
//  CatedoryView.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import SnapKit
import UIKit

class CategoryView: UIView {
    var collectionView: UICollectionView!
    var categories: [String] = []
    var delegate: CategoryViewDelegate!
    var categoryCell = [Category]()
    
    // MARK: - init category view
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    func configure(with categories: [String]) {
        self.categories = categories
        collectionView.reloadData()
    }
}

