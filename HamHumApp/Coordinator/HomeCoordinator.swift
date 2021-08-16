//
//  HomeCoordinator.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        
        let homeViewController = HomeViewController()
        navigationController = UINavigationController(rootViewController: homeViewController)
        
//        homeViewController.navigationItem.title = "nav"
        navigationController.navigationBar.isHidden = true
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "homeicon"), tag: 100)
    }
}
