

import UIKit

class PersonViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "Person"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Person")
    }

}
