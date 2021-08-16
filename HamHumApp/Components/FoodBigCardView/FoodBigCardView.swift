//
//  FoodBigCardView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class FoodBigCardView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let imageViewFavorite: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let viewFoodRate: FoodRateView = {
        let view = FoodRateView()
        return view
    }()
    
    private let stackViewRate: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyFour
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h3)
        return label
    }()
    
    private let imageViewStatus: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let imageViewDeliveryPrice: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "delivery-price")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let labelDeliveryPrice: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyFour
        label.font = UIFont(name: Font.CenturyGothic.regular, size: FontSize.h5)
        return label
    }()
    
    private let imageViewDeliveryTime: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "delivery-time")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let labelDeliveryTime: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyFour
        label.font = UIFont(name: Font.CenturyGothic.regular, size: FontSize.h5)
        return label
    }()
    
    private let viewCategory: UIView = {
        let view = UIView()
        view.backgroundColor = Color.neutrals.greyOne
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let labelCategory: UILabel = {
        let label = UILabel()
        label.text = "BURGER"
        label.textColor = Color.neutrals.greyThree
        label.font = UIFont(name: Font.CenturyGothic.regular, size: FontSize.h5)
        return label
    }()
    
    private let collectionViewCategory: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    var categories = [String]()
    
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
        configureCollectionView()
    }
    
    private func setupUI(){
        layer.cornerRadius = 20
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
    }
    
    func configure(with model: FoodBigCardViewUIModel){
        
        viewFoodRate.configure(with: FoodRateViewUIModel(rate: model.foodRateUIModel.rate, rateCount: model.foodRateUIModel.rateCount))
        
        if let image = model.image {
            imageView.image = UIImage(named: image)
        }
        
        if model.isFavorite {
            imageViewFavorite.image = UIImage(named: "icon-favorite-food")
        }
        
        labelTitle.text = model.title
        
        if model.isAvailable {
            imageViewStatus.image = UIImage(named: "available")
        }
        
        labelDeliveryPrice.text = model.deliveryPrice
        labelDeliveryTime.text = model.deliveryTime
        categories = model.categories
        collectionViewCategory.reloadData()
    }
    
    private func configureCollectionView() {
        collectionViewCategory.delegate = self
        collectionViewCategory.dataSource = self
        
        collectionViewCategory.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func layout(){
        
        snp.makeConstraints { (make) in
            make.width.equalTo(295)
        }

        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        addSubview(viewFoodRate)
        viewFoodRate.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(12)
        }
        
        addSubview(imageViewFavorite)
        imageViewFavorite.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.width.height.equalTo(30)
        }
        
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(13)
        }
        
        addSubview(imageViewStatus)
        imageViewStatus.snp.makeConstraints { (make) in
            make.leading.equalTo(labelTitle.snp.trailing).offset(10)
            make.centerY.equalTo(labelTitle)
            make.width.height.equalTo(15)
        }
        
        addSubview(imageViewDeliveryPrice)
        imageViewDeliveryPrice.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(13)
        }
        
        addSubview(labelDeliveryPrice)
        labelDeliveryPrice.snp.makeConstraints { (make) in
            make.centerY.equalTo(imageViewDeliveryPrice)
            make.leading.equalTo(imageViewDeliveryPrice.snp.trailing).offset(10)
        }
        
        addSubview(imageViewDeliveryTime)
        imageViewDeliveryTime.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.leading.equalTo(labelDeliveryPrice.snp.trailing).offset(10)
        }
        
        addSubview(labelDeliveryTime)
        labelDeliveryTime.snp.makeConstraints { (make) in
            make.centerY.equalTo(imageViewDeliveryTime)
            make.leading.equalTo(imageViewDeliveryTime.snp.trailing).offset(10)
        }
        
        addSubview(viewCategory)
        viewCategory.snp.makeConstraints { (make) in
            make.top.equalTo(imageViewDeliveryPrice.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(13)
        }
        
        viewCategory.addSubview(labelCategory)
        labelCategory.snp.makeConstraints { (make) in
            make.top.leading.equalTo(viewCategory).offset(6)
            make.bottom.trailing.equalTo(viewCategory).offset(-6)
        }
        
        addSubview(collectionViewCategory)
        collectionViewCategory.snp.makeConstraints { (make) in
            make.top.equalTo(viewCategory.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.equalToSuperview().offset(-13)
        }
        
    }
}

extension FoodBigCardView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
       
        cell.configure(name: "selam")
        
        return cell
    }
    
    
}
