//
//  ProfileCoordinator.swift
//  HamHumApp
//
//  Created by ALEMDAR on 17.08.2021.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        
        let profileViewController = ProfileViewController()
        navigationController = UINavigationController(rootViewController: profileViewController)
        
        profileViewController.navigationItem.title = "Profile"
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile-tab-icon"), tag: 100)
        
        setupUI()
    }
    
    private func setupUI(){
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.backgroundColor = .red
        navigationController.navigationBar.titleTextAttributes = [.font: UIFont(name: Font.CenturyGothic.bold, size: FontSize.h2) as Any]
    
        navigationController.navigationBar.setValue(true, forKey: "hidesShadow")
    }
}
