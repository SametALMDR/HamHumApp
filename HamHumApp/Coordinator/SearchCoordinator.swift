//
//  SearchCoordinator.swift
//  HamHumApp
//
//  Created by ALEMDAR on 17.08.2021.
//

import UIKit

class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        
        let searchViewController = SearchViewController()
        navigationController = UINavigationController(rootViewController: searchViewController)
        
        searchViewController.navigationItem.title = "Search Food"
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "search-tab-icon"), tag: 100)
    }
}
