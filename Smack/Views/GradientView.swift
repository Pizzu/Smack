//
//  GradientView.swift
//  Smack
//
//  Created by Luca Lo Forte on 29/05/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

// @IBDesignable per poter renderizzare la view anche nella storyboard
@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColor : UIColor =  #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet{
            //ogni volta che cambiamo la proprietà nello storyboard viene aggiornato il design (chiama layoutSubviews)
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor : UIColor =  #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer() //CA --> Core Animation
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0) // 0 stands for first layer
    }
}
