

import UIKit
import FirebaseCore


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        
        let layout = UICollectionViewFlowLayout()
         
        let catalogVC = CatalogViewControllerKitchens(collectionViewLayout: layout)
        let personVC = PersonViewController()
        let settingsVC = SettingsViewController()
        
        
        
        let personNC = UINavigationController(rootViewController: personVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [catalogVC, personNC, settingsNC]
        tabBarController.view.backgroundColor = .red
        tabBarController.tabBar.backgroundColor = .white
        
        
        
        window?.rootViewController = tabBarController
        
        return true
    }


}

