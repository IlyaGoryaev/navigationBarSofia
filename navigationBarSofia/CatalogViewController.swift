//
//  CatalogViewController.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 19.06.2023.
//

import UIKit

class CatalogViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Catalog"
    }
    
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Catalog")
    }
}
