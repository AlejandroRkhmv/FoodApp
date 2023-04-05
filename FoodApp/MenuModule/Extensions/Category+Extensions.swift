//
//  Category+Extensions.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import SnapKit
import UIKit

// MARK: - extension Category
extension Category {
    // MARK: - initialize
    func initialize() {
        contentView.addSubview(categoryButton)
        categoryButton.addTarget(self, action: #selector(categoryTapped), for: .touchUpInside)
        categoryButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        if self.tag == 0 {
            selectedCategoryOnAppear()
        }
    }
    
    func selectedCategoryOnAppear() {
        categoryButton.setTitleColor(UIColor(named: ColorEnum.tabBarSelected.rawValue), for: .normal)
        categoryButton.backgroundColor = UIColor(named: ColorEnum.selectedCategoryButton.rawValue)
    }
    
    // MARK: - tappedButton
    @objc
    func categoryTapped(_ sender: UIButton) {
        
        print(delegate.categories[self.tag])
        categoryButton.setTitleColor(UIColor(named: ColorEnum.tabBarSelected.rawValue), for: .normal)
        categoryButton.backgroundColor = UIColor(named: ColorEnum.selectedCategoryButton.rawValue)
        delegate.onCategoryActive(tag: self.tag)
        
        guard let titleOfButton = categoryButton.titleLabel?.text,
        let row = delegate.delegate?.menuPresenter.getCountOfCategoriesDictionary()[titleOfButton] else { return }
        delegate.send(row: row)
        
    }
    
    // MARK: - unselected
    func unselectedButton(tag: Int) {
        if self.tag != tag {
            categoryButton.setTitleColor(UIColor(named: ColorEnum.selectedCategoryButton.rawValue), for: .normal)
            categoryButton.backgroundColor = contentView.backgroundColor
        }
    }
    
    // MARK: - configure
    func configure(with filling: String) {
        categoryButton.setTitle(filling, for: .normal)
        categoryButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8))
        }
    }
}
