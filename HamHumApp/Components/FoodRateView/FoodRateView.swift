//
//  FoodRateView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class FoodRateView: UIView {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private let labelRate: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h5)
        return label
    }()
    
    private let imageViewStar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "star")
        return imageView
    }()
    
    private let labelRateCount: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyTwo
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h6)
        return label
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
        backgroundColor = .white
        layer.cornerRadius = 15
    }
    
    func configure(with model: FoodRateViewUIModel){
        labelRate.text = "\(model.rate)"
        labelRateCount.text = "(\(model.rateCount))"
    }
    
    private func layout(){
        
        snp.makeConstraints { (make) in
            make.height.equalTo(30)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        stackView.addArrangedSubview(labelRate)
        stackView.addArrangedSubview(imageViewStar)
        stackView.addArrangedSubview(labelRateCount)
    }
    
}
