//
//  CircleImage.swift
//  Smack
//
//  Created by Luca Lo Forte on 03/06/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
