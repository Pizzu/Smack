//
//  MessageCell.swift
//  Smack
//
//  Created by Luca Lo Forte on 06/06/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var messageBodyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(message: Message) {
        self.messageBodyLabel.text = message.message
        self.userNameLabel.text = message.userName
        //self.timeStampLabel.text = message.timeStamp
        self.userImage.image = UIImage(named: message.userAvatar)
        self.userImage.backgroundColor = UserDataService.instance.getUIColor(components: message.userAvatarColor)
    }
}
