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
        
        guard var isoDate = message.timeStamp else {return}
        
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5)
        isoDate = String(isoDate[..<end])
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            timeStampLabel.text = finalDate
        }
        
        
    }
}
