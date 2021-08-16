//
//  PopularCard.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import UIKit

class FoodSmallCardView: UIView {
    
    private let stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let stackViewContainerRight: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 21
        return imageView
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h5)
        return label
    }()
    
    private let labelSubtitle: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyTwo
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h6)
        return label
    }()
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        label.textColor = Color.primary.red
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
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
    }
    
    func configure(with model: FoodSmallCardViewUIModel){
        
        if let image = model.image {
            imageView.image = UIImage(named: image)
        }
        
        labelTitle.text = model.title
        labelSubtitle.text = model.subtitle
        labelPrice.text = model.price
        
    }
    
    private func layout(){
        
        self.snp.makeConstraints { (make) in
            make.width.equalTo(150)
        }
        
        addSubview(stackViewContainer)
        stackViewContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        stackViewContainer.addArrangedSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(52)
        }
        
        stackViewContainer.addArrangedSubview(stackViewContainerRight)
        stackViewContainerRight.addArrangedSubview(labelTitle)
        stackViewContainerRight.addArrangedSubview(labelSubtitle)
        stackViewContainerRight.addArrangedSubview(labelPrice)
    }
    
}
