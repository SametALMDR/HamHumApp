//
//  CategoryCollectionViewCell.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class FoodBigCardViewCategoryCollectionViewCell: UICollectionViewCell {

    private let labelCategory: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyThree
        label.font = UIFont(name: "CenturyGothic", size: 11)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI(){
        backgroundColor = Color.neutrals.greyOne
        layer.cornerRadius = 5
    }
    
    func configure(name: String) {
        labelCategory.text = name.uppercased()
    }
    
    private func layout() {
  
        addSubview(labelCategory)
        labelCategory.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(6)
            make.bottom.trailing.equalToSuperview().offset(-6)
        }
    }
}
