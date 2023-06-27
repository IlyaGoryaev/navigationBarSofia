
import UIKit

class FavoritesHeaderView: UIView {
    
    let label = UILabel()
    
    let redView = UIView()
    
    let backButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension FavoritesHeaderView{
    
    func style(){
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        redView.backgroundColor = .red
        
        label.text = "Избранное"
        
        label.font = UIFont(name: "Inter", size: 18)
        
        backButton.backgroundColor = .systemGray5
        
        backButton.layer.cornerRadius = 15
    
        
    }
    
    func layout(){
        
        addSubview(label)
        addSubview(redView)
        addSubview(backButton)
        
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            redView.topAnchor.constraint(equalTo: bottomAnchor),
            redView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 140),
            redView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -140),
            
            redView.heightAnchor.constraint(equalToConstant: 1),
            
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)

        
        
        ])
        
        
    }
    
}
