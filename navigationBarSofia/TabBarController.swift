
import UIKit
import Firebase

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil{
                let personController = PersonViewController()
                self.viewControllers![2] = personController
            } else {
                let controller = UIViewController()
                controller.view.backgroundColor = .red
                self.viewControllers![2] = controller
            }
        }
    }

}
extension TabBarController{
    
    func style(){
        
    }
    
    func layout(){
        
    }
}
