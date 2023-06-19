//
//  AppDelegate.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 19.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let catalogVC = CatalogViewController()
        let personVC = PersonViewController()
        let settingsVC = SettingsViewController()
        
        let personNC = UINavigationController(rootViewController: personVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [catalogVC, personNC, settingsNC]
        tabBarController.view.backgroundColor = .red
        tabBarController.tabBar.backgroundColor = .brown
        
        
        
        window?.rootViewController = tabBarController
        
        return true
    }


}

