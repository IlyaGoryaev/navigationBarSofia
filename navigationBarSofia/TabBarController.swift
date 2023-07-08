
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
                let image = UIImageView()
                image.image = UIImage(named: "Profile")
                image.contentMode = .scaleAspectFill
                image.translatesAutoresizingMaskIntoConstraints = false
                controller.view.addSubview(image)
                NSLayoutConstraint.activate([
                    image.topAnchor.constraint(equalTo: controller.view.topAnchor),
                    image.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
                    image.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor),
                    image.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor)
                
                ])
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
