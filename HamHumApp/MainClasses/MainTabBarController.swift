//
//  MainTabBarController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private enum Constants {
        static let showOpacity: Float = 1.0
        static let showRadius: CGFloat = 7
        enum IndicatorImage {
            static let size: CGSize = CGSize(width: 5, height: 5)
            static let position: CGPoint = CGPoint(x: 0, y: 25)
        }
    }
    
    private let homeNC = UINavigationController(rootViewController: HomeViewController())
    private let searchNC = UINavigationController(rootViewController: SearchViewController())
    private let cartNC = UINavigationController(rootViewController: CartViewController())
    private let orderNC = UINavigationController(rootViewController: OrderViewController())
    private let profileNC = UINavigationController(rootViewController: ProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureTabBarItems()
        configureNavigationBar()
        viewControllers = [homeNC, searchNC, cartNC, orderNC, profileNC]
        
    }
    
    private func configureTabBarItems() {
        homeNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home-tab-icon"), tag: 100)
        searchNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "search-tab-icon"), tag: 101)
        let cartTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "cart-tab-icon"), tag: 102)
        cartTabBarItem.imageInsets = UIEdgeInsets(top: -25, left: 0, bottom: 25, right: 0)
        cartNC.tabBarItem = cartTabBarItem
        orderNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "order-tab-icon"), tag: 103)
        profileNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile-tab-icon"), tag: 104)
    }
    
    private func configureNavigationBar(){
        homeNC.navigationBar.barTintColor = Color.primary.red
        homeNC.navigationBar.backgroundColor = Color.primary.red
        homeNC.navigationBar.tintColor = .white
        homeNC.navigationBar.titleTextAttributes = [.font: UIFont(name: Font.CenturyGothic.bold, size: FontSize.f18) as Any,
                                                    .foregroundColor: UIColor.white]
        
        searchNC.navigationBar.barTintColor = Color.primary.red
        searchNC.navigationBar.backgroundColor = Color.primary.red
        searchNC.navigationBar.tintColor = .white
        searchNC.navigationBar.titleTextAttributes = [.font: UIFont(name: Font.CenturyGothic.bold, size: FontSize.f18) as Any,
                                                    .foregroundColor: UIColor.white]
        
        cartNC.navigationBar.isTranslucent = false
        cartNC.navigationBar.barTintColor = Color.primary.red
        cartNC.navigationBar.backgroundColor = Color.primary.red
        cartNC.navigationBar.tintColor = .white
        cartNC.navigationBar.titleTextAttributes = [.font: UIFont(name: Font.CenturyGothic.bold, size: FontSize.f18) as Any,
                                                    .foregroundColor: UIColor.white]
        
        orderNC.navigationBar.isTranslucent = false
        orderNC.navigationBar.barTintColor = Color.primary.red
        orderNC.navigationBar.backgroundColor = Color.primary.red
        orderNC.navigationBar.tintColor = .white
        orderNC.navigationBar.titleTextAttributes = [.font: UIFont(name: Font.CenturyGothic.bold, size: FontSize.f18) as Any,
                                                    .foregroundColor: UIColor.white]
        
        profileNC.navigationBar.isTranslucent = false
        profileNC.navigationBar.barTintColor = Color.primary.red
        profileNC.navigationBar.backgroundColor = Color.primary.red
        profileNC.navigationBar.tintColor = .white
        profileNC.navigationBar.titleTextAttributes = [.font: UIFont(name: Font.CenturyGothic.bold, size: FontSize.f18) as Any,
                                                    .foregroundColor: UIColor.white]
    }
    
    private func setupUI() {
        setValue(MainTabBar(), forKey: "tabBar")
        tabBar.backgroundColor = UIColor.white
        tabBar.layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        tabBar.layer.shadowOpacity = Constants.showOpacity
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = Constants.showRadius
        tabBar.selectionIndicatorImage = createCircleSelectionIndicator(
            color: Color.primary.red,
            rect: CGRect(x: Constants.IndicatorImage.position.x,
                         y: Constants.IndicatorImage.position.y,
                         width: Constants.IndicatorImage.size.width,
                         height: Constants.IndicatorImage.size.height
            )
        )
    }
    
    private func createCircleSelectionIndicator(color: UIColor, rect: CGRect) -> UIImage {
        
        let renderWidth = rect.size.width + rect.origin.x
        let renderHeight = rect.size.height + rect.origin.y
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: renderWidth, height: renderHeight))
        
        let image = renderer.image { (context) in

            let rectangle = rect
            context.cgContext.setFillColor(color.cgColor)
            context.cgContext.setLineWidth(0)
            
            context.cgContext.addEllipse(in: rectangle)
            context.cgContext.drawPath(using: .fillStroke)
            
        }
        
        return image
    }
    
}
