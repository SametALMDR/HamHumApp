//
//  CartTableViewCell.swift
//  HamHumApp
//
//  Created by ALEMDAR on 16.08.2021.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    private let viewCartItem: CartItemCardView = {
        let view = CartItemCardView()
        return view
    }()
    
    private let viewContent: UIView = {
        let view = UIView()
        return view
    }()
    
    static let identifier = "CartTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        viewContent.backgroundColor = Color.secondary.background
    }
    
    func configure(image: String?, name: String, count: Int, singlePrice: Double){
        let model = CartItemCardViewUIModel(image: image, name: name, count: count, singlePrice: singlePrice)
        viewCartItem.configure(with: model)
    }
    
    private func layout(){
        
        contentView.addSubview(viewContent)
        viewContent.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(contentView)
        }
        
        viewContent.addSubview(viewCartItem)
        viewCartItem.snp.makeConstraints { (make) in
            make.top.equalTo(viewContent).offset(5)
            make.leading.equalTo(viewContent).offset(10)
            make.bottom.equalTo(viewContent).offset(-5)
            make.trailing.equalTo(viewContent).offset(-10)
           
        }
    
    }

}
