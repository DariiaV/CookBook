//
//  TabBarController.swift
//  CookBook
//
//  Created by Александр Косяков on 29.11.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
        tabBarController?.tabBar.isHidden = true
    }    
    private func generateTabBar() {
        let kitchenVC = UINavigationController(rootViewController: KitchenViewController())
        viewControllers = [
            generateVC(
                viewController: FistScreenViewController(),
                title: "Home",
                image: UIImage(systemName: "house.fill")
            ),
            generateVC(
                viewController: kitchenVC,
                title: "Kitchen",
                image: UIImage(systemName: "cooktop.fill")
            ),
          
            generateVC(
                viewController: FavouriteViewController(),
                title: "Favourite",
                image: UIImage(systemName: "star.fill")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
