

import UIKit

class PersonViewController: ViewController {
    
    let label = UILabel()
    
    let button = UIButton()

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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        
    }
    
    func layout(){
        
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
        
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
    }
    
    @objc func tappedBackButton(){
        
        UIApplication.shared.delegate?.window?!.windowScene?.keyWindow?.rootViewController = CatalogViewControllerKitchens(collectionViewLayout: UICollectionViewLayout())
        
    }
    
    
    
}
