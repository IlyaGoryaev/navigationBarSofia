
import UIKit
import Shiny


class SettingsViewController: ViewController {
    
    let shinyView = ShinyView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Settings"
        shinyView.colors = [.systemGray4, .systemGray3]
        shinyView.startUpdates()
        view.addSubview(shinyView)
    
    }
    
    
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Settings")
    }
}
