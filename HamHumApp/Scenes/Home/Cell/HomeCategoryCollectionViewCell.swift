//
//  CategoryCollectionViewCell.swift
//  HamHumApp
//
//  Created by ALEMDAR on 20.08.2021.
//

import UIKit
import SnapKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {
    
    private let viewCategory: CategoryTitleWithImage = {
        let view = CategoryTitleWithImage()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: Category) {
        viewCategory.configure(with: CategoryTitleWithImageUIModel(name: category.name ?? "", image: category.image))
    }
    
    func selected(){
        viewCategory.selected()
    }
    
    func notSelected(){
        viewCategory.notSelected()
    }
    
    private func layout(){
        contentView.addSubview(viewCategory)
        viewCategory.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
}
