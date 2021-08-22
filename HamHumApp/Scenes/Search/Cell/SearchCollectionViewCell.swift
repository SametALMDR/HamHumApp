//
//  SearchCollectionViewCell.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    private let viewContent: UIView = {
        let view = UIView()
        return view
    }()
    
    private let viewCard: FoodBigCardView = {
        let view = FoodBigCardView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with food: SearchFood) {

        var categories: [String] = []
        
        food.categories?.forEach {
            categories.append($0.name ?? "")
        }
    
        let rateUIModel = FoodRateViewUIModel(rate: food.rate ?? 0, rateCount: food.rateCount)
        
        let viewUIModel = FoodBigCardViewUIModel(foodRateUIModel: rateUIModel,
                               isFavorite: true,
                               image: food.image,
                               title: food.name ?? "",
                               isAvailable: food.isAvailable ?? false,
                               deliveryPrice: food.deliveryPrice ?? "",
                               deliveryTime: food.preparationTime ?? "",
                               categories: categories)
        
        viewCard.configure(with: viewUIModel)
    }
    
    private func layout(){
        
        contentView.addSubview(viewContent)
        viewContent.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        viewContent.addSubview(viewCard)
        viewCard.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }

}
