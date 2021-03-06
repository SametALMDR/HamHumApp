//
//  StandardStepper.swift
//  HamHumApp
//
//  Created by ALEMDAR on 16.08.2021.
//

import UIKit

protocol ExcellentStepperDelegate: AnyObject {
    func valueChanged()
}

class ExcellentStepper: UIView {
    
    //MARK: - Views
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 7
        return stackView
    }()
    
    private let imageViewDecrease: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "stepper-minus")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.isUserInteractionEnabled = false
        textField.textColor = .white
        textField.font = UIFont(name: Font.CenturyGothic.bold, size: 18)
        return textField
    }()
    
    private let imageViewIncrease: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "stepper-plus")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    //MARK: - Variables
    
    weak var delegate: ExcellentStepperDelegate?
    var value: Double = 0
    private var minimumValue: Double = 0
    private var maximumValue: Double = 100
    private var stepValue: Double = 1
    private var showDecimal: Bool = false
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    //MARK: - Functions
    private func commonInit(){
        configureStepper()
        setupUI()
        layout()
    }
    
    private func configureStepper(){

        textField.text = showDecimal ? "\(value)" : "\(Int(value))"
        
        let tapGestureDecrease = UITapGestureRecognizer()
        tapGestureDecrease.addTarget(self, action: #selector(decreaseButtonTapped))
        imageViewDecrease.addGestureRecognizer(tapGestureDecrease)
        
        let tapGestureIncrease = UITapGestureRecognizer()
        tapGestureIncrease.addTarget(self, action: #selector(increaseButtonTapped))
        imageViewIncrease.addGestureRecognizer(tapGestureIncrease)
    }
    
    private func setupUI(){
        backgroundColor = Color.primary.red
        layer.cornerRadius = 25/2
    }
    
    func configure(with model: StandardStepperUIModel) {
        value = model.value
        textField.text = showDecimal ? "\(value)" : "\(Int(value))"
        minimumValue = model.minimumValue
        maximumValue = model.maximumValue
        stepValue = model.stepValue
    }
    
    func setValue(value: Double) {
        self.value = value
        textField.text = showDecimal ? "\(value)" : "\(Int(value))"
    }
    
    @objc func decreaseButtonTapped(){
        let newValue = currentValue() - stepValue
        if newValue < minimumValue {
            return
        }
        textField.text = showDecimal ? "\(newValue)" : "\(Int(newValue))"
        value = newValue
        self.delegate?.valueChanged()
    }
    
    @objc func increaseButtonTapped(){
        let newValue = currentValue() + stepValue
        if newValue > maximumValue {
            return
        }
        textField.text = showDecimal ? "\(newValue)" : "\(Int(newValue))"
        value = newValue
        self.delegate?.valueChanged()
    }
    
    private func currentValue() -> Double{
        return Double(textField.text ?? "\(value)") ?? value
    }
    
    private func layout(){
       
        snp.makeConstraints { (make) in
            make.height.equalTo(25)
        }
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        stackView.addArrangedSubview(imageViewDecrease)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(imageViewIncrease)
    }
    
}
