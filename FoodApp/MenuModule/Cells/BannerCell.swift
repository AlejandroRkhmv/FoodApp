//
//  BannerCell.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import SnapKit
import UIKit

class BannerCell: UITableViewCell {
    var collectionView: UICollectionView!
    var banners: BannersCells = []
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    func configure(with banners: BannersCells) {
        self.banners = banners
        collectionView.reloadData()
    }
}
