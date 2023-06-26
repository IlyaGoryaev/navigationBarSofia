

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
         
        let catalogVC = CatalogViewControllerKitchens(collectionViewLayout: layout)
        let personVC = PersonViewController()
        let settingsVC = SettingsViewController()
        
        
        
        let personNC = UINavigationController(rootViewController: personVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
            
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [catalogVC, personNC, settingsNC]
        tabBarController.view.backgroundColor = .red
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.isTranslucent = true
        
        
        window?.rootViewController = tabBarController
        
        return true
    }

}

