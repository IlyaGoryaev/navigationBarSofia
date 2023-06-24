

import UIKit

class BlackView: UIView {
    
    let viewCall = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension BlackView{
    
    func style(){
        
        viewCall.translatesAutoresizingMaskIntoConstraints = false
        viewCall.backgroundColor = .white
        viewCall.layer.cornerRadius = 20
        
    }
    
    func layout(){
        
        addSubview(viewCall)
        
        NSLayoutConstraint.activate([
        
            viewCall.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewCall.centerYAnchor.constraint(equalTo: centerYAnchor),
            viewCall.heightAnchor.constraint(equalToConstant: 400),
            viewCall.widthAnchor.constraint(equalToConstant: 300),
            
        ])
        
        
    }
    
    
}
