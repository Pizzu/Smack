//
//  AvatarCell.swift
//  Smack
//
//  Created by Luca Lo Forte on 02/06/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = UIColor.lightGray
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configureCell(index: Int, type: AvatarType) {
        if type == AvatarType.dark {
            avatarImage.image = UIImage(named: "dark\(index)")
            self.backgroundColor = UIColor.lightGray
        } else {
            avatarImage.image = UIImage(named: "light\(index)")
            self.backgroundColor = UIColor.darkGray
        }
    }
}
