//
//  SettingsHeaderView.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 29.06.2023.
//

import UIKit
import Firebase

class SettingsHeaderView: UIView {
    
    let faqButton = UIButton()
    
    let callButton = UIButton()
    
    let profileButton = UIButton()
    
    let redLine = UIButton()
    
    var redLineLeadingConstraint: NSLayoutConstraint?
    
    var redLineWidthConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        profileButton.addTarget(self, action: #selector(authOut), for: .touchUpInside)
        
        style()
        
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func authOut(){
        do{
            try Auth.auth().signOut()
        } catch {
            
        }
        
        
    }
}
extension SettingsHeaderView{
    
    func style(){
        backgroundColor = .systemGray6
        faqButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        redLine.translatesAutoresizingMaskIntoConstraints = false
        faqButton.setTitle("FAQ", for: .normal)
        faqButton.setTitleColor(.label, for: .normal)
        redLine.backgroundColor = .red
        callButton.setTitle("Позвонить нам", for: .normal)
        callButton.setTitleColor(.label, for: .normal)
        profileButton.backgroundColor = .systemGray4
        profileButton.layer.cornerRadius = 15
        profileButton.clipsToBounds = true
        
    }
    
    func layout(){
        
        addSubview(faqButton)
        addSubview(callButton)
        addSubview(profileButton)
        addSubview(redLine)
        
        redLineLeadingConstraint = redLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18)
        
        redLineWidthConstraint = redLine.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([
            
            faqButton.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            faqButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            callButton.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            callButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120),
            
            profileButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            profileButton.widthAnchor.constraint(equalToConstant: 30),
            profileButton.heightAnchor.constraint(equalToConstant: 30),
            
            redLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            redLineLeadingConstraint!,
            redLine.heightAnchor.constraint(equalToConstant: 2),
            redLineWidthConstraint!
        ])
        
        
    }
    
}
