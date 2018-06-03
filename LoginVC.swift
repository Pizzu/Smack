//
//  LoginVC.swift
//  Smack
//
//  Created by Luca Lo Forte on 30/05/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    //Outlets
    @IBOutlet weak var containerLogo: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logoTitleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginBtn: RoundedButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    let separetorEmailView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.423529923, green: 0.6870478392, blue: 0.8348321319, alpha: 1)
        return view
    }()
    
    let separetorPasswordView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.423529923, green: 0.6870478392, blue: 0.8348321319, alpha: 1)
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        containerLogo.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(separetorEmailView)
        view.addSubview(separetorPasswordView)
        
        //iOS 9 constraints
    
        closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 28).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        containerLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        containerLogo.widthAnchor.constraint(equalToConstant: 122.5).isActive = true
        containerLogo.heightAnchor.constraint(equalTo: logoImageView.heightAnchor).isActive = true
        
        logoImageView.leftAnchor.constraint(equalTo: containerLogo.leftAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: containerLogo.topAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        logoTitleLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 12).isActive = true
        logoTitleLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        logoTitleLabel.rightAnchor.constraint(equalTo: containerLogo.rightAnchor).isActive = true
        logoTitleLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: containerLogo.bottomAnchor, constant: 40).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        separetorEmailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        separetorEmailView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 14).isActive = true
        separetorEmailView.widthAnchor.constraint(equalTo: emailLabel.widthAnchor).isActive = true
        separetorEmailView.heightAnchor.constraint(equalToConstant: 2).isActive = true

        passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: separetorEmailView.bottomAnchor, constant: 14).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: emailLabel.widthAnchor).isActive = true
        passwordLabel.heightAnchor.constraint(equalTo: emailLabel.heightAnchor).isActive = true

        separetorPasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        separetorPasswordView.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 14).isActive = true
        separetorPasswordView.widthAnchor.constraint(equalTo: passwordLabel.widthAnchor).isActive = true
        separetorPasswordView.heightAnchor.constraint(equalToConstant: 2).isActive = true

        loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginBtn.topAnchor.constraint(equalTo: separetorPasswordView.bottomAnchor, constant: 40).isActive = true
        loginBtn.widthAnchor.constraint(equalTo: separetorPasswordView.widthAnchor).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true

        registerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor).isActive = true
        registerBtn.widthAnchor.constraint(equalTo: loginBtn.widthAnchor).isActive = true
        registerBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        spinner.isHidden = true
        emailLabel.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        passwordLabel.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func loginBtnPressed(_ sender: RoundedButton) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let email = emailLabel.text, emailLabel.text != "" else {return}
        guard let pass = passwordLabel.text, passwordLabel.text != "" else {return}
        
        AuthService.instance.loginUser(with: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUseryByEmail(completion: { (success) in
                    if success {
                        self.spinner.stopAnimating()
                        self.spinner.isHidden = true
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: self)
    }
    
}
















