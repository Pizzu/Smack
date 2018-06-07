//
//  ChannelCell.swift
//  Smack
//
//  Created by Luca Lo Forte on 04/06/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    
    
    @IBOutlet weak var channelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.backgroundColor = UIColor(white: 1, alpha: 0.2)
        } else {
            self.backgroundColor = UIColor.clear
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.channelTitle ?? ""
        channelName.text = "#\(title)"
        channelName.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        for channelId in MessageService.instance.unreadChannels {
            if channelId == channel.id {
                channelName.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
            }
            
        }
    }

}
