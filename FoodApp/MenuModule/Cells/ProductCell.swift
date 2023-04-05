//
//  ProductCell.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import SnapKit
import UIKit

class ProductCell: UITableViewCell {
    var delegate: MenuViewController?
    var productsFromCoreData = [FoodProducts]()
    var productImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    let productTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    let productDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(named: ColorEnum.colorDescription.rawValue)
        return label
    }()
    let priceButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: ColorEnum.priceButtonColor.rawValue)?.cgColor
        button.setTitleColor(UIColor(named: ColorEnum.priceButtonColor.rawValue), for: .normal)
        return button
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        initialize()
    }
    
    // MARK: - initialize
    func initialize() {
        addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.width.equalTo(132)
            make.height.equalTo(132)
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.top.equalTo(contentView.snp.top).inset(24)
        }
        addSubview(productTitle)
        productTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(32)
            make.leading.equalTo(contentView.snp.leading).inset(180)
            make.trailing.equalTo(contentView.snp.trailing).inset(24)
        }
        
        addSubview(productDescription)
        productDescription.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.top.equalTo(productTitle.snp.bottom).offset(8)
            make.leading.equalTo(contentView.snp.leading).inset(180)
            make.trailing.equalTo(contentView.snp.trailing).inset(24)
        }
        
        addSubview(priceButton)
        priceButton.snp.makeConstraints { make in
            make.width.equalTo(87)
            make.height.equalTo(32)
            make.top.equalTo(productDescription.snp.bottom).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).inset(24)
        }
        priceButtonAddTarget()
    }
    
    // MARK: - configure
    func configure(with filling: Product) {
        self.productTitle.text = filling.title
        self.productDescription.text = filling.text
        self.priceButton.setTitle("от \(filling.price) р", for: .normal)
        delegate?.loadImage(from: filling.image, completionHandler: { [weak self] data in
            guard let self = self else { return }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.productImage.image = UIImage(data: data)
            }
        })
    }
    
    func priceButtonAddTarget() {
        self.priceButton.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func priceButtonTapped() {
        print(self.priceButton.titleLabel?.text ?? "100")
    }
}




