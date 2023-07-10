

import UIKit
import FirebaseCore
import Firebase
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
        window?.overrideUserInterfaceStyle = .light
        
        let layout = UICollectionViewFlowLayout()
        
        let layoutSettings = UICollectionViewFlowLayout()
        
        let layoutMainScreen = UICollectionViewFlowLayout()
         
        let catalogVC = CatalogViewControllerKitchens(collectionViewLayout: layout)
        let personVC = PersonViewController()
        let settingsVC = SettingsViewController(collectionViewLayout: layoutSettings)
        let mainVC = MainScreenViewController(collectionViewLayout: layoutMainScreen)
        
        
        let personNC = UINavigationController(rootViewController: personVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        settingsNC.navigationBar.barTintColor = .white
        let mainNC = UINavigationController(rootViewController: mainVC)
        let catalogNC = UINavigationController(rootViewController: catalogVC)
        settingsNC.navigationBar.prefersLargeTitles = true
        settingsNC.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        //catalogNC.navigationBar.prefersLargeTitles = true
        catalogNC.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        catalogNC.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Inter-Bold", size: 18) as Any]
        let tabBarController = TabBarController()
        tabBarController.tabBar.backgroundColor = .systemGray6
        tabBarController.viewControllers = [mainNC, catalogNC, personNC, settingsNC]
        tabBarController.view.backgroundColor = .navigationBarColor
        tabBarController.tabBar.backgroundColor = .systemGray6
        tabBarController.tabBar.isTranslucent = true
        
        
        window?.rootViewController = tabBarController
        
        
        
        return true
    }

}

