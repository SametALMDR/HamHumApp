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
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75/2
        return imageView
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 20)
        return label
    }()
    
    private let stepper: ExcellentStepper = {
        let stepper = ExcellentStepper()
        return stepper
    }()
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        label.textColor = Color.primary.red
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 20)
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
        stepper.delegate = self
    }
    
    private func setupUI(){
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
    }
    
    private var singlePrice: Double = 0
    
    func configure(with model: CartItemCardViewUIModel){
        if let imageUrl = model.image {
            imageView.kf.setImage(with: URL(string: imageUrl))
        }
        labelName.text = model.name
        singlePrice = model.singlePrice
        let singleTotal = String(format: "%.2f", model.singlePrice * Double(model.count))
        labelPrice.text = "$ \(singleTotal)"
        stepper.setValue(value: Double(model.count))
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

extension CartItemCardView: ExcellentStepperDelegate {
    
    func valueChanged() {
        let singleTotal = String(format: "%.2f", singlePrice * stepper.value)
        labelPrice.text = "$ \(singleTotal)"
    }
    
}
