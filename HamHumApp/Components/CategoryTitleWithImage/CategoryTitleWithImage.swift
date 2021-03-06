//
//  RoundedCategoryTitleView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit
import Kingfisher

class CategoryTitleWithImage: UIView {
    
    private let viewImage: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.text = "Burger"
        label.textColor = .white
        label.font = UIFont(name: Font.CenturyGothic.regular, size: FontSize.h5)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "burger")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    }
    
    private func setupUI(){
        backgroundColor = Color.primary.red
        layer.cornerRadius = 33
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = Color.primary.red.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
    }
    
    func configure(with model: CategoryTitleWithImageUIModel){
        if let image = model.image {
            if let imageUrl = URL(string: image) {
                imageView.kf.setImage(with: imageUrl)
            }
        }
        labelName.text = model.name
    }
    
    func selected() {
        backgroundColor = Color.primary.red
        layer.cornerRadius = 33
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = Color.primary.red.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        labelName.textColor = .white
    }
    
    func notSelected() {
        backgroundColor = .white
        layer.cornerRadius = 33
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = Color.neutrals.greyTwo.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        labelName.textColor = Color.neutrals.greyThree
    }
    
    private func layout(){

        
        addSubview(viewImage)
        viewImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(4)
            make.width.height.equalTo(60)
        }

        viewImage.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(45)
        }

        addSubview(labelName)
        labelName.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-23)
            make.centerX.equalToSuperview()
        }
        
    }
    
}
