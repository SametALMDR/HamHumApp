//
//  CartCoordinator.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import UIKit

class CartCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        
        let cartViewController = CartViewController()
        navigationController = UINavigationController(rootViewController: cartViewController)
        
        cartViewController.navigationItem.title = "Cart Food"
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "carticon"), tag: 100)
        tabBarItem.imageInsets = UIEdgeInsets(top: -25, left: 0, bottom: 25, right: 0)
        navigationController.tabBarItem = tabBarItem
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.backgroundColor = .red
        navigationController.navigationBar.titleTextAttributes = [.font: UIFont(name: Font.CenturyGothic.bold, size: FontSize.h3) as Any]
    
        navigationController.navigationBar.setValue(true, forKey: "hidesShadow")

    }
}
