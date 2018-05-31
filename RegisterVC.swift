//
//  RegisterVC.swift
//  Smack
//
//  Created by Luca Lo Forte on 31/05/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }

}
