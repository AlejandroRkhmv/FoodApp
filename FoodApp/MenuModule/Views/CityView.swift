//
//  CityView.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import SnapKit
import UIKit

class CityView: UIView {
    // MARK: - constrains
    private enum Constraints {
        static let cityHeight: CGFloat = 20
        static let cityWidth: CGFloat = 61
    }
    
    private var cityLabel: UILabel = {
        let label = UILabel()
        label.text = City.moscow.rawValue
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    // MARK: - init
    init() {
        super.init(frame: .zero)
        start()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func getCityLabel() -> UILabel {
        return cityLabel
    }
    
    public func changeCityNameLabel(text: String) {
        cityLabel.text = text
    }
}

private extension CityView {
    func start() {
        addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.greaterThanOrEqualTo(Constraints.cityWidth)
            make.height.equalTo(Constraints.cityHeight)
        }
    }
}
