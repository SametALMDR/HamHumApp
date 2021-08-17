//
//  FavoriteCoordiantor.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import UIKit

class OrderCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        
        let orderViewController = OrderViewController()
        navigationController = UINavigationController(rootViewController: orderViewController)
        
        orderViewController.navigationItem.title = "Orders"
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "order-tab-icon"), tag: 100)
    }
    
}
