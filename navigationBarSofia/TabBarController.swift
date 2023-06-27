
import UIKit

class TabBarController: UITabBarController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension TabBarController{
    
    func style(){
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Избранное", for: .normal)
        
    }
    
    func layout(){
        
        tabBar.addSubview(button)
        
        
        NSLayoutConstraint.activate([
            //button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30)
        
        ])
        
    }
}
