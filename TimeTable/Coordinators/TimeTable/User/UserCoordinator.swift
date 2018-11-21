//
//  UserCoordinator.swift
//  TimeTable
//
//  Created by Piotr Pawluś on 20/11/2018.
//  Copyright © 2018 Railwaymen. All rights reserved.
//

import UIKit

class UserCoordinator: BaseNavigationCoordinator, BaseTabBarCordninatorType {
    
    var root: UIViewController {
        return self.navigationController
    }
    var tabBarItem: UITabBarItem
    
    override init(window: UIWindow?) {
        self.tabBarItem = UITabBarItem(title: "User", image: nil, selectedImage: nil)
        super.init(window: window)
        let controller = UIViewController()
        controller.view.backgroundColor = UIColor.orange
        navigationController.setViewControllers([controller], animated: false)
        self.root.tabBarItem = tabBarItem
    }
}
