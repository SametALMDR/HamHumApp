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
    
    let homeCoordinator = HomeCoordinator()
    let searchCoordinator = SearchCoordinator()
    let cartCoordinator = CartCoordinator()
    let orderCoordinator = OrderCoordinator()
    let profileCoordinaor = ProfileCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        homeCoordinator.start()
        searchCoordinator.start()
        cartCoordinator.start()
        orderCoordinator.start()
        profileCoordinaor.start()
        
        viewControllers = [
            homeCoordinator.navigationController,
            searchCoordinator.navigationController,
            cartCoordinator.navigationController,
            orderCoordinator.navigationController,
            profileCoordinaor.navigationController
        ]
        
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
