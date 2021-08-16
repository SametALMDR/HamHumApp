//
//  FoodRateView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class FoodAddonView: UIView {
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyThree
        label.font = UIFont(name: Font.CenturyGothic.regular, size: 14)
        return label
    }()
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyFour
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 14)
        return label
    }()
    
    private let imageViewSelection: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "addon-not-selected")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupUI()
        layout()
    }
    
    private func setupUI(){
        
    }
    
    func configure(with model: FoodAddonViewUIModel){
        labelName.text = "\(model.name)"
        labelPrice.text = "\(model.price)"
    }
    
    private func layout(){
        
        addSubview(labelName)
        labelName.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalToSuperview()
        }
        
        addSubview(imageViewSelection)
        imageViewSelection.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelName)
            make.trailing.equalToSuperview()
        }
        
        addSubview(labelPrice)
        labelPrice.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelName)
            make.trailing.equalTo(imageViewSelection.snp.leading).offset(-10)
        }
    }
    
}
