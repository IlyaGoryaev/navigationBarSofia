import UIKit

func makeFuvButton(text: String) -> UIButton{
    
    let button = UIButton()
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "Heart"), for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true

    return button
    
    
}
