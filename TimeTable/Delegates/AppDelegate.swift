//
//  AppDelegate.swift
//  TimeTable
//
//  Created by Piotr Pawluś on 17/10/2018.
//  Copyright © 2018 Railwaymen. All rights reserved.
//

import UIKit
import CoreStore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var appCoordinator: AppCoordinator = {
        return AppCoordinator(window: window,
                              storyboardsManager: StoryboardsManager.shared,
                              errorHandler: errorHandler,
                              serverConfigurationManager: serverConfigurationManager,
                              coreDataStack: coreDataStack,
                              bundle: Bundle.main)
    }()
    
    private lazy var errorHandler: ErrorHandlerType = {
        return ErrorHandler()
    }()
    
    private lazy var serverConfigurationManager: ServerConfigurationManagerType = {
        return ServerConfigurationManager(urlSession: URLSession.shared, userDefaults: UserDefaults.standard)
    }()
    
    private lazy var coreDataStack: CoreDataStackType = {
        do {
            return try CoreDataStack(buildStack: { (xcodeModelName, fileName) throws -> DataStack in
                let dataStack = DataStack(xcodeModelName: xcodeModelName)
                try dataStack.addStorageAndWait(
                    SQLiteStore(
                        fileName: fileName,
                        localStorageOptions: .recreateStoreOnModelMismatch
                    )
                )
                return dataStack
            })
        } catch {
            fatalError("Core Data Stack error:\n \(error)")
        }
    }()

    // MARK: - UIApplicationDelegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        appCoordinator.start()
        return true
    }
}
