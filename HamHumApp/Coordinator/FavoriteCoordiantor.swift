//
//  FavoriteCoordiantor.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import UIKit

class FavoriteCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        
        let favoriteViewController = FoodDetailViewController()
        navigationController = UINavigationController(rootViewController: favoriteViewController)
        
        favoriteViewController.navigationItem.title = "nav"
        navigationController.navigationBar.isHidden = true
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "favicon"), tag: 100)
    }
    
}
