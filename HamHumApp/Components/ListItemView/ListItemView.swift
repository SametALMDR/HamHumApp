//
//  FoodRateView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class ListItemView: UIView {

    private let viewLeftIcon: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 5
        return view
    }()
    
    private let imageViewLeftIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let labelItem: UILabel = {
        let label = UILabel()
        label.textColor = Color.neutrals.greyFour
        label.numberOfLines = 0
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 16)
        return label
    }()
    
    private let imageViewRightIcon: UIImageView = {
        let imageView = UIImageView()
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
        
    }
    
    func configure(with model: ListItemViewUIModel){
        if let icon = model.leftIcon {
            imageViewLeftIcon.image = UIImage(named: icon)?.setColor(color: Color.neutrals.greyThree)
        }
        labelItem.text = model.name
        if let icon = model.rightIcon {
            imageViewRightIcon.image = UIImage(named: icon)?.setColor(color: Color.neutrals.greyThree)
        }
    }
    
    private func layout(){
        
       
        addSubview(viewLeftIcon)
        viewLeftIcon.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalToSuperview()
        }
        
        viewLeftIcon.addSubview(imageViewLeftIcon)
        imageViewLeftIcon.snp.makeConstraints { (make) in
            make.top.leading.equalTo(viewLeftIcon).offset(12)
            make.bottom.trailing.equalTo(viewLeftIcon).offset(-12)
            make.width.height.equalTo(25)
        }
        
        addSubview(imageViewRightIcon)
        imageViewRightIcon.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(viewLeftIcon)
        }
        
        addSubview(labelItem)
        labelItem.snp.makeConstraints { (make) in
            make.leading.equalTo(viewLeftIcon.snp.trailing).offset(25)
            make.trailing.equalTo(imageViewRightIcon).offset(-25)
            make.centerY.equalTo(viewLeftIcon)
        }
    }
    
}
