

import UIKit
import FirebaseCore
//https://stackoverflow.com/questions/31490358/how-to-delete-item-from-collection-view
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var defaults = UserDefaults.standard
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        
        let layout = UICollectionViewFlowLayout()
        
        let layoutSettings = UICollectionViewFlowLayout()
         
        let catalogVC = CatalogViewControllerKitchens(collectionViewLayout: layout)
        let personVC = PersonViewController()
        let settingsVC = SettingsViewController(collectionViewLayout: layoutSettings)
        let mainVC = MainScreenViewController()
        
        
        let personNC = UINavigationController(rootViewController: personVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        settingsNC.navigationBar.barTintColor = .white
        let mainNC = UINavigationController(rootViewController: mainVC)
        let catalogNC = UINavigationController(rootViewController: catalogVC)
        catalogNC.navigationBar.isHidden = true
        settingsNC.navigationBar.prefersLargeTitles = true
        
        
        let tabBarController = TabBarController()
        tabBarController.tabBar.backgroundColor = .systemGray6
        tabBarController.viewControllers = [mainNC, catalogVC, personNC, settingsNC]
        tabBarController.view.backgroundColor = .navigationBarColor
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.isTranslucent = true
        
        
        window?.rootViewController = tabBarController
        
        return true
    }

}

