//
//  BigRateView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class BigRateView: UIView {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private let labelRate: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h3)
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
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h3)
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

    }
    
    func configure(with model: BigRateViewUIModel){
        labelRate.text = "\(model.rate)"
        labelRateCount.text = "(\(model.rateCount))"
    }
    
    private func layout(){
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        imageViewStar.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        stackView.addArrangedSubview(imageViewStar)
        stackView.addArrangedSubview(labelRate)
        stackView.addArrangedSubview(labelRateCount)
    }
    
}
