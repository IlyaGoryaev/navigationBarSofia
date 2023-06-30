
import UIKit

class SettingsFAQCell: UICollectionViewCell {
    
    let firstQ = UIButton()
    
    let secondQ = UIButton()
    
    let thirdQ = UIButton()
    
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
extension SettingsFAQCell{
    
    func style(){
        
        firstQ.translatesAutoresizingMaskIntoConstraints = false
        
        secondQ.translatesAutoresizingMaskIntoConstraints = false
        
        thirdQ.translatesAutoresizingMaskIntoConstraints = false
        
        firstQ.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        secondQ.backgroundColor = .white
        
        thirdQ.backgroundColor = .white
        
        view.backgroundColor = .white
        
        firstQ.setTitle("Как авторизоваться в приложении?", for: .normal)
        
        firstQ.titleLabel?.font = UIFont(name: "Inter", size: 15)
        
        firstQ.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        firstQ.setTitleColor(.label, for: .normal)
        
        secondQ.setTitle("Какие функции доступны после авторизации?", for: .normal)
        
        secondQ.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        secondQ.setTitleColor(.label, for: .normal)
        
        secondQ.titleLabel?.font = UIFont(name: "Inter", size: 15)
        
        thirdQ.setTitle("Что такое купоны?", for: .normal)
        
        thirdQ.setTitleColor(.label, for: .normal)
        
        thirdQ.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        thirdQ.titleLabel?.font = UIFont(name: "Inter", size: 15)
        
    }
    
    func layout(){
    
        addSubview(view)
        view.addSubview(firstQ)
        view.addSubview(secondQ)
        view.addSubview(thirdQ)
        
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            firstQ.topAnchor.constraint(equalTo: view.topAnchor),
            firstQ.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstQ.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstQ.heightAnchor.constraint(equalToConstant: 43),
            
            secondQ.topAnchor.constraint(equalTo: firstQ.bottomAnchor),
            secondQ.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondQ.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondQ.heightAnchor.constraint(equalToConstant: 43),
            
            thirdQ.topAnchor.constraint(equalTo: secondQ.bottomAnchor),
            thirdQ.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            thirdQ.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            thirdQ.heightAnchor.constraint(equalToConstant: 43),
            
            firstQ.titleLabel!.leadingAnchor.constraint(equalTo: firstQ.imageView!.leadingAnchor, constant: 1),
            
            thirdQ.titleLabel!.leadingAnchor.constraint(equalTo: thirdQ.imageView!.leadingAnchor, constant: 1),
            
            secondQ.titleLabel!.leadingAnchor.constraint(equalTo: secondQ.imageView!.leadingAnchor, constant: 1)
            
        ])
        
    }
    
}
