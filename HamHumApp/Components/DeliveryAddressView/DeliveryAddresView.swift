//
//  MenuIconView.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

class DeliveryAddressView: UIView {
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Delivery to"
        label.textColor = Color.neutrals.greyTwo
        label.font = UIFont(name: Font.CenturyGothic.regular, size: FontSize.h5)
        return label
    }()
    
    private let labelAddress: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = Color.primary.red
        label.font = UIFont(name: Font.CenturyGothic.bold, size: FontSize.h4)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
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
    
    private func layout(){
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }

        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(labelAddress)
    }
    
}
