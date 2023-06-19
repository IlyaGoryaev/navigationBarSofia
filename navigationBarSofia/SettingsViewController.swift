//
//  SettingsViewController.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 19.06.2023.
//

import UIKit

class SettingsViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Settings"
    }
    
    
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Settings")
    }
}
