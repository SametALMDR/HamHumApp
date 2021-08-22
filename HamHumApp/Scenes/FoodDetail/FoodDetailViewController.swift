//
//  FoodDetailViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit
import SnapKit
import Kingfisher

class FoodDetailViewController: BaseViewController<FoodDetailViewModel> {
    
    private enum Constants {
        enum NavigationBar {
            static let title: String = "Food Detail"
        }
    }
    
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
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "food-detail")
        return imageView
    }()
    
    private let labelFoodName: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 30)
        return label
    }()
    
    private let rateView: BigRateView = {
        let rateView = BigRateView()
        return rateView
    }()
    
    private let labelReview: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h4)
        label.textColor = Color.primary.red
        label.attributedText = NSAttributedString(string: "See Review", attributes: [.underlineStyle: NSUnderlineStyle.thick.rawValue])
        return label
    }()
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h1)
        label.textColor = Color.primary.red
        return label
    }()
    
    private let labelDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.CenturyGothic.regular, size: FontSize.h3)
        label.textColor = Color.neutrals.greyThree
        label.numberOfLines = 0
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

        setNavigationTitle(title: Constants.NavigationBar.title)
        showNavigationBar()
        viewModel.delegate = self
        configureAddToCartButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.load()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        clearStackViewData()
    }
    
    private func configureAddToCartButton(){
        buttonAddToCart.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
    }
    
    @objc func addToCart(){
        CoreDataManager.shared.insertToCart(id: viewModel.foodID ?? 0, count: Int(stepper.value), addons: [])
        //MARK: - Toast added to cart
    }
    
    override func setupUI(){
        view.backgroundColor = .white
        
        stepper.configure(with: StandardStepperUIModel(value: 1, minimumValue: 1, maximumValue: 100, stepValue: 1))
    }
    
    override func layout(){
        
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
    
    func clearStackViewData(){
        stackViewAddons.arrangedSubviews.forEach { (view) in
            stackViewAddons.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
}

extension FoodDetailViewController: FoodDetailViewModelDelegate {
    
    func loadData() {
        labelFoodName.text = viewModel.food?.name
        labelPrice.text = "\(viewModel.food?.price ?? 0) \(viewModel.food?.currency ?? "")"
        labelDescription.text = viewModel.food?.description
        labelDescription.setLineSpacing(spacing: 10)
        if let imageUrl = viewModel.food?.image {
            imageViewFood.kf.setImage(with: URL(string: imageUrl))
        }
        let rateUIModel = BigRateViewUIModel(rate: viewModel.food?.rate ?? 0,
                                             rateCount: viewModel.food?.rate_count ?? 0)
        rateView.configure(with: rateUIModel)
        
        if let addons = viewModel.food?.addons {
            for addon in addons {
                let addonView = FoodAddonView()
                let addonViewUIModel = FoodAddonViewUIModel(name: "\(addon.name ?? "")", price: "\(addon.price ?? 0)")
                addonView.configure(with: addonViewUIModel)
                stackViewAddons.addArrangedSubview(addonView)
            }
        }
    }
    
}
