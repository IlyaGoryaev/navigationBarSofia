

import UIKit


class DetailViewController: NSObject {
    
    let view = UIView(frame: (UIApplication.shared.delegate?.window?!.windowScene?.keyWindow!.frame)!)
    let backButton = UIButton()
    var image = UIImageView()
    var label = UILabel()
    
    func presentDetailViewController(){
        view.isHidden = false
        
        if let keyWindow = UIApplication.shared.delegate?.window?!.windowScene?.keyWindow{
            view.backgroundColor = .red
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.setImage(UIImage(systemName: "xmark"), for: [])
            image.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(image)
            view.addSubview(label)
            view.addSubview(backButton)
            
            NSLayoutConstraint.activate([
                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backButton.widthAnchor.constraint(equalToConstant: 60),
                
                image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                image.heightAnchor.constraint(equalToConstant: 300),
                
                label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            keyWindow.addSubview(view)
        }
    }
    
}
