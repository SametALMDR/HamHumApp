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
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
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
    
    private let collectionViewCategory: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 75, height: 25)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var categories = [String]()
    
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
        
        if let imageUrl = model.image {
            imageView.kf.setImage(with: URL(string: imageUrl))
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

        collectionViewCategory.register(cellType: FoodBigCardViewCategoryCollectionViewCell.self)
    }
    
    private func layout(){

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
            make.trailing.equalToSuperview().offset(-10)
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
            make.leading.equalTo(imageViewDeliveryPrice.snp.trailing).offset(5)
        }
        
        addSubview(labelDeliveryTime)
        labelDeliveryTime.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelDeliveryPrice)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        addSubview(imageViewDeliveryTime)
        imageViewDeliveryTime.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelDeliveryPrice)
            make.trailing.equalTo(labelDeliveryTime.snp.leading).offset(-5)
        }
        

        addSubview(collectionViewCategory)
        collectionViewCategory.snp.makeConstraints { (make) in
            make.top.equalTo(labelDeliveryTime.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-5)
            make.trailing.equalToSuperview().offset(-12)
        }
        
    }
}

extension FoodBigCardView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodBigCardViewCategoryCollectionViewCell.identifier, for: indexPath) as? FoodBigCardViewCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(name: categories[indexPath.row])

        return cell
    }


}
