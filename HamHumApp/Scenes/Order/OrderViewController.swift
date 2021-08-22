//
//  OrderViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 17.08.2021.
//

import UIKit

class OrderViewController: BaseViewController<OrderViewModel> {
    
    private enum Constants {
        enum NavigationBar {
            static let title: String = "Orders"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationTitle(title: Constants.NavigationBar.title)
        setBackgroundColor(color: Color.secondary.background)
    }
    
}
