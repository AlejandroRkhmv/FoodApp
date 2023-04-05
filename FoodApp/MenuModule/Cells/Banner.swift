//
//  Banner.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import SnapKit
import UIKit

class Banner: UICollectionViewCell {
    private var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Banner {
    // MARK: - initialize
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16))
        }
    }
    
    // MARK: - configure
    func configure(with filling: BannersCellFilling) {
        imageView.image = filling.image
    }
}
