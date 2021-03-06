//
//  BaseNavigationCoordinator.swift
//  TimeTable
//
//  Created by Piotr Pawluś on 20/11/2018.
//  Copyright © 2018 Railwaymen. All rights reserved.
//

import UIKit

class BaseNavigationCoordinator: BaseCoordinator {
    
    internal var navigationController: UINavigationController
    
    // MARK: - Initialization
    override init(window: UIWindow?) {
        self.navigationController = UINavigationController()
        super.init(window: window)
        window?.rootViewController = navigationController
        navigationController.interactivePopGestureRecognizer?.delegate = nil
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init(window: nil)
    }
}
