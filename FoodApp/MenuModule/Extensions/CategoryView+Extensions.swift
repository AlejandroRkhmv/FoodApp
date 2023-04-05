//
//  CategoryView+Extension.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import SnapKit
import UIKit

extension CategoryView {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.backgroundColor = UIColor(named: ColorEnum.background.rawValue)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(Category.self, forCellWithReuseIdentifier: String(describing: Category.self))
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 0))
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let category = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Category.self), for: indexPath) as? Category {
            category.configure(with: self.categories[indexPath.item])
            category.tag = indexPath.item
            category.delegate = self
            category.unselectedButton(tag: 0)
            categoryCell.append(category)
            return category
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 88, height: 32)
    }
}

// MARK: - CategoryDelegate
extension CategoryView: CategoryDelegate {
    
    func send(row: Int) {
        delegate?.scrollTo(row: row)
    }
    
    func onCategoryActive(tag: Int) {
        for cell in categoryCell {
            cell.unselectedButton(tag: tag)
        }
    }
}
