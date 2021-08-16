//
//  CategoryCollectionViewCell.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    private let labelCategory: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyThree
        label.font = UIFont(name: "CenturyGothic", size: 11)
        return label
    }()
    
    static let identifier = "CategoryCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI(){
        backgroundColor = .black
        layer.cornerRadius = 5
    }
    
    func configure(name: String) {
        labelCategory.text = name
    }
    
    private func layout() {
  
        addSubview(labelCategory)
        labelCategory.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(6)
            make.bottom.trailing.equalToSuperview().offset(-6)
        }
    }
}
