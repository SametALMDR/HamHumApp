//
//  FoodDetailViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let scrollViewContent: UIView = {
        let view = UIView()
        return view
    }()
    
    private let imageViewFood: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "food-detail")
        return imageView
    }()
    
    private let labelFoodName: UILabel = {
        let label = UILabel()
        label.text = "Cranberry Cake"
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: "CenturyGothic-Bold", size: 30)
        return label
    }()
    
    private let rateView: BigRateView = {
        let rateView = BigRateView()
        return rateView
    }()
    
    private let labelReview: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CenturyGothic-Bold", size: FontSize.h4)
        label.textColor = Color.primary.red
        label.attributedText = NSAttributedString(string: "See Review", attributes: [.underlineStyle: NSUnderlineStyle.thick.rawValue])
        return label
    }()
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        label.text = "$3.49"
        label.font = UIFont(name: "CenturyGothic-Bold", size: FontSize.h1)
        label.textColor = Color.primary.red
        return label
    }()
    
    private let labelDescription: UILabel = {
        let label = UILabel()
        label.text = """
            LTart cranberries, sweet buttery cake, and a fantastic texture all combine in this Cranberry Christmas Cake.This recipe is a holiday favorite!
            """
        label.font = UIFont(name: Font.CenturyGothic.regular, size: FontSize.h3)
        label.textColor = Color.neutrals.greyThree
        label.numberOfLines = 0
        label.setLineSpacing(spacing: 10)
        return label
    }()
    
    private let labelAddon: UILabel = {
        let label = UILabel()
        label.text = "Choice of Add on"
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 20)
        return label
    }()
    
    private let stackViewAddons: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        return stackView
    }()
    
    private let buttonAddToCart: StandardButton = {
        let button = StandardButton()
        button.configure(with: StandardButtonUIModel(title: "Add to cart"))
        return button
    }()
    
    private let stepper: StandardStepper = {
        let stepper = StandardStepper()
        return stepper
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layout()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        
        let models = [
            FoodAddonViewUIModel(name: "Cream", price: "+$2.30"),
            FoodAddonViewUIModel(name: "Chocolate sauce", price: "+$2.30"),
            FoodAddonViewUIModel(name: "Vanilla ice cream", price: "+$2.30")
        ]
        let addon1 = FoodAddonView()
        addon1.configure(with: models[0])
        
        let addon2 = FoodAddonView()
        addon2.configure(with: models[1])
        
        let addon3 = FoodAddonView()
        addon3.configure(with: models[2])
        
        stackViewAddons.addArrangedSubview(addon1)
        stackViewAddons.addArrangedSubview(addon2)
        stackViewAddons.addArrangedSubview(addon3)
        rateView.configure(with: BigRateViewUIModel(rate: 4.2, rateCount: 67))
        stepper.configure(with: StandardStepperUIModel(value: 1, minimumValue: 1, maximumValue: 100, stepValue: 1))
    }
    
    private func layout(){
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(safeArea)
        }
        
        scrollView.addSubview(scrollViewContent)
        scrollViewContent.snp.makeConstraints { (make) in
            make.top.leading.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            make.trailing.equalTo(scrollView)
            make.height.equalTo(view).priority(250)
            make.width.equalTo(view)
        }
        
        scrollViewContent.addSubview(imageViewFood)
        imageViewFood.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(scrollViewContent)
            make.height.equalTo(250)
        }
        
        scrollViewContent.addSubview(labelFoodName)
        labelFoodName.snp.makeConstraints { (make) in
            make.top.equalTo(imageViewFood.snp.bottom).offset(15)
            make.leading.equalTo(scrollViewContent).offset(25)
        }
        
        scrollViewContent.addSubview(rateView)
        rateView.snp.makeConstraints { (make) in
            make.top.equalTo(labelFoodName.snp.bottom).offset(20)
            make.leading.equalTo(scrollViewContent).offset(25)
        }
        
        scrollViewContent.addSubview(labelReview)
        labelReview.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.leading.equalTo(rateView.snp.trailing).offset(20)
        }
        
        scrollViewContent.addSubview(labelPrice)
        labelPrice.snp.makeConstraints { (make) in
            make.top.equalTo(rateView.snp.bottom).offset(15)
            make.leading.equalTo(scrollViewContent).offset(25)
        }
        
        scrollViewContent.addSubview(labelDescription)
        labelDescription.snp.makeConstraints { (make) in
            make.top.equalTo(labelPrice.snp.bottom).offset(20)
            make.leading.equalTo(scrollViewContent).offset(25)
            make.trailing.equalTo(scrollViewContent).offset(-25)
        }
        
        scrollViewContent.addSubview(labelAddon)
        labelAddon.snp.makeConstraints { (make) in
            make.top.equalTo(labelDescription.snp.bottom).offset(20)
            make.leading.equalTo(scrollViewContent).offset(25)
            make.trailing.equalTo(scrollViewContent).offset(-25)
        }
        
        scrollViewContent.addSubview(stackViewAddons)
        stackViewAddons.snp.makeConstraints { (make) in
            make.top.equalTo(labelAddon.snp.bottom).offset(20)
            make.leading.equalTo(scrollViewContent).offset(25)
            make.trailing.equalTo(scrollViewContent).offset(-25)
        }
        
        scrollView.addSubview(buttonAddToCart)
        buttonAddToCart.snp.makeConstraints { (make) in
            make.top.equalTo(stackViewAddons.snp.bottom).offset(45)
            make.leading.equalTo(scrollViewContent).offset(25)
            make.trailing.equalTo(scrollViewContent).offset(-25)
            make.bottom.equalTo(scrollViewContent).offset(-50)
        }
        
        scrollView.addSubview(stepper)
        stepper.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelPrice)
            make.trailing.equalTo(scrollViewContent).offset(-25)
        }
    }
    
}

