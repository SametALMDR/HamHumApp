//
//  MenuIconView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class MenuIconView: UIView {
    
    private let imageViewIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menu_icon")
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
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
    }
    
    private func layout(){
        snp.makeConstraints { (make) in
            make.width.equalTo(45)
            make.height.equalTo(45)
        }
        
        addSubview(imageViewIcon)
        imageViewIcon.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
}
