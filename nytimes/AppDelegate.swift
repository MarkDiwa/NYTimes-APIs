//
//  AppDelegate.swift
//  nytimes
//
//  Created by user204729 on 11/23/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        navigateToStartViewController()
        return true
    }

}

extension AppDelegate {
    
    func navigateToStartViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let startViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: startViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
