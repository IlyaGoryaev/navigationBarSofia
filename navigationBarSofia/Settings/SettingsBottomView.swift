//
//  SettingsBottomView.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 29.06.2023.
//

import UIKit

class SettingsBottomView: UIView {
    
    let button1 = UIButton()
    
    let button2 = UIButton()
    
    let button3 = UIButton()
    
    let blackLine = UIView()
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        style()
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension SettingsBottomView{
    
    func style(){
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        blackLine.translatesAutoresizingMaskIntoConstraints = false
        blackLine.backgroundColor = .black
        button1.backgroundColor = .white
        button2.backgroundColor = .settingsButton
        button3.backgroundColor = .settingsButton
        
        setUpButtonTitle(button: button3, title: "О приложении \n Версия \(String(describing: appVersion!))" as NSString)
        setUpButtonTitle(button: button1, title: "Уведомления \n Настройка пуш-уведомлений")
        setUpButtonTitle(button: button2, title: "Вход и авторизация \n Вход по Face-id")
        button1.layer.cornerRadius = 30
        button2.layer.cornerRadius = 30
        button3.layer.cornerRadius = 30
        //button1.layer.shadowOpacity = 0.2
        button2.layer.shadowOpacity = 0.2
        button3.layer.shadowOpacity = 0.2
        button1.setImage(UIImage(named: "Coupon"), for: .normal)
        button1.imageEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 270)
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.systemGray5.cgColor
        //var config =  UIButton.Configuration.plain()
        //config.imagePlacement = .leading
        //config.imagePadding = 25
        //button1.configuration = config
    }
    
    func layout(){
        
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        //addSubview(blackLine)
        
        NSLayoutConstraint.activate([
            
            button1.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            button1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button1.heightAnchor.constraint(equalToConstant: 100),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            button2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button2.heightAnchor.constraint(equalToConstant: 100),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            button3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button3.heightAnchor.constraint(equalToConstant: 100),
            
            //button1.titleLabel!.leadingAnchor.constraint(equalTo: button1.imageView!.leadingAnchor, constant: 15),
            //button3.titleLabel!.leadingAnchor.constraint(equalTo: button3.imageView!.leadingAnchor, constant: 15),
            //button2.titleLabel!.leadingAnchor.constraint(equalTo: button2.imageView!.leadingAnchor, constant: 15)
        
        ])
        
        
    }
    
    func setUpButtonTitle(button: UIButton, title: NSString){
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        let buttonText: NSString = title
        let newlineRangeForButton: NSRange = buttonText.range(of: "\n")
        var substring1ForButton: NSString = ""
        var substring2ForButton: NSString = ""
        if(newlineRangeForButton.location != NSNotFound) {
            substring1ForButton = buttonText.substring(to: newlineRangeForButton.location) as NSString
            substring2ForButton = buttonText.substring(from: newlineRangeForButton.location) as NSString
                }
        let fontForButton:UIFont? = UIFont(name: "Inter-SemiBold", size: 18)
                let attrString = NSMutableAttributedString(
                    string: substring1ForButton as String,
                    attributes: NSDictionary(
                        object: fontForButton!,
                        forKey: NSAttributedString.Key.font as NSCopying) as? [NSAttributedString.Key : Any] )
        let font1ForButton:UIFont? = UIFont(name: "Inter", size: 12)
               let attrString1 = NSMutableAttributedString(
                   string: substring2ForButton as String,
                   attributes: NSDictionary(
                       object: font1ForButton!,
                       forKey: NSAttributedString.Key.font as NSCopying) as? [NSAttributedString.Key : Any])
        attrString.append(attrString1)
        button.setAttributedTitle(attrString, for: .normal)
    }
    
}
