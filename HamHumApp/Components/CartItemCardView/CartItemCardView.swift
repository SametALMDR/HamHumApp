//
//  CartItemCardView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 16.08.2021.
//

import UIKit

class CartItemCardView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cart-image")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.text = "Hot Dog"
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: "CenturyGothic-Bold", size: 20)
        return label
    }()
    
    private let stepper: StandardStepper = {
        let stepper = StandardStepper()
        return stepper
    }()
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        label.text = "$8.99"
        label.textColor = Color.primary.red
        label.font = UIFont(name: "CenturyGothic-Bold", size: 25)
        return label
    }()
    
    private let stackViewContent: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    private let stackViewContentRight: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let stackViewContentRightBottom: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        return stackView
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
    
    func configure(with model: CartItemCardViewUIModel){
        
    }
    
    private func layout(){
        
        addSubview(stackViewContent)
        stackViewContent.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(15)
            make.bottom.trailing.equalToSuperview().offset(-15)
        }
        
        stackViewContent.addArrangedSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(75)
        }
        stackViewContent.addArrangedSubview(stackViewContentRight)
        stackViewContentRight.addArrangedSubview(labelName)
        stackViewContentRight.addArrangedSubview(stackViewContentRightBottom)
        stackViewContentRightBottom.addArrangedSubview(stepper)
        stackViewContentRightBottom.addArrangedSubview(labelPrice)
    }
}
