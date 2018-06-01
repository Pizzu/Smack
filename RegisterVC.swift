//
//  RegisterVC.swift
//  Smack
//
//  Created by Luca Lo Forte on 31/05/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    //IBOutlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }

    @IBAction func chooseAvatarPressed(_ sender: UIButton) {
    }
    
    @IBAction func generateBGPressed(_ sender: UIButton) {
    }
    
    @IBAction func createAccountPressed(_ sender: RoundedButton) {
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(with: email, password: pass) { (success) in
            
            if success {
                AuthService.instance.loginUser(with: email, password: pass, completion: { (success) in
                    if success {
                        print("Logged In User", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
}
