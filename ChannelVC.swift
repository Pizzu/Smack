//
//  ChanelVC.swift
//  Smack
//
//  Created by Luca Lo Forte on 29/05/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func prepareForUndwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: self)
    }
}
