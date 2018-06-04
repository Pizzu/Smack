//
//  AddChannelVC.swift
//  Smack
//
//  Created by Luca Lo Forte on 04/06/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    //Outlets
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        nameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        descriptionTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc func handleTap() {
       dismiss(animated: true, completion: nil)
    }

    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: RoundedButton) {
    }
    
}
