//
//  PersonViewController.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 19.06.2023.
//

import UIKit

class PersonViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "Person"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Person")
    }

}
