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
        channelName.text = "#\(channel.channelTitle)" ?? ""
    }

}
