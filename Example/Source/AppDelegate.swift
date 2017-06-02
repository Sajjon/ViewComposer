//
//  AppDelegate.swift
//  ViewComposer-Example
//
//  Created by Alexander Cyon on 2017-05-30.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
}


//MARK: Private Methods
private extension AppDelegate {
    
    func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.backgroundColor = UIColor.white
        
        let rootViewController = TableViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationController
        self.window = window
    }
}
