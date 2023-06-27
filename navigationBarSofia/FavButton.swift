//
//  FavButton.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 27.06.2023.
//

import UIKit

class FavButton: UIButton {
    
    private let redColor: UIColor = UIColor(red: 254.0 / 255.0, green: 116.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.layer.cornerRadius / 2
        self.backgroundColor = redColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }

}
