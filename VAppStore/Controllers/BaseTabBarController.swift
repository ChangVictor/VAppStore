//
//  BaseTabBarController.swift
//  VAppStore
//
//  Created by Victor Chang on 02/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()

    }
    
    fileprivate func setupViewControllers() {
        viewControllers = [
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppSearchControler(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true

        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
    
        return navController
    }
}
