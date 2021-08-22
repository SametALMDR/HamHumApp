//
//  HomePopularCollectionViewCell.swift
//  HamHumApp
//
//  Created by ALEMDAR on 20.08.2021.
//

import UIKit
import SnapKit

class HomePopularCollectionViewCell: UICollectionViewCell {
    
    private let viewPopular: FoodSmallCardView = {
        let view = FoodSmallCardView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with food: PopularFood) {
        let UIModel = FoodSmallCardViewUIModel(image: food.image,
                                               title: food.name ?? "",
                                               subtitle: food.subtitle ?? "",
                                               price: "\(food.price ?? 0) \(food.currency ?? "")")
        viewPopular.configure(with: UIModel)
    }
    
    private func layout(){
        contentView.addSubview(viewPopular)
        viewPopular.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }

}
