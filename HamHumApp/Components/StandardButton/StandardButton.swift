//
//  StandardButton.swift
//  HamHumApp
//
//  Created by ALEMDAR on 16.08.2021.
//

import UIKit

class StandardButton: UIButton {
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 21)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setupUI()
        layout()
    }
    
    private func setupUI(){
        backgroundColor = Color.primary.red
        layer.cornerRadius = 75/2
    }
    
    func configure(with model: StandardButtonUIModel){
        labelTitle.text = model.title
    }
    
    private func layout(){
        
        snp.makeConstraints { (make) in
            make.height.equalTo(75)
        }
        
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
}
