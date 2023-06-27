

import UIKit

class PersonViewController: ViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Person"
        
        style()
        layout()
        
        
                
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Person")
    }

}
extension PersonViewController{
    
    func style(){
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "fuhwufw"
        
    }
    
    func layout(){
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
        
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
        
    }
    
    
    
}
