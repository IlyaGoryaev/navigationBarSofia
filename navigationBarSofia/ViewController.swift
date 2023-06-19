//
//  CatalogViewController.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 19.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override init(nibName nibNameOrNill: String?, bundle nibBundleOrNill: Bundle?){
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(){
        
        
    }
    
    func setTabBarImage(imageName: String, title: String){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
        
    }
    
}
