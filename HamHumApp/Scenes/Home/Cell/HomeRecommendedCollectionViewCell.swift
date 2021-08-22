//
//  HomeRecommendedCollectionViewCell.swift
//  HamHumApp
//
//  Created by ALEMDAR on 20.08.2021.
//

import UIKit
import SnapKit

class HomeRecommendedCollectionViewCell: UICollectionViewCell {
    
    private let viewRecommended: FoodBigCardView = {
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
    
    func configure(with food: RecommendedFood) {

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
        
        viewRecommended.configure(with: viewUIModel)
    }
    
    private func layout(){
        contentView.addSubview(viewRecommended)
        viewRecommended.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }

}
