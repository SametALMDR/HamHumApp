//
//  CartViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import UIKit

class CartViewController: UIViewController {
    
    private let cartItem: CartItemCardView = {
        let item = CartItemCardView()
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.secondary.background
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(cartItem)
        cartItem.snp.makeConstraints { (make) in
            make.top.leading.equalTo(safeArea).offset(10)
            make.trailing.equalTo(safeArea).offset(-10)
        }
    }
}
