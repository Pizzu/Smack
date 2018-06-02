//
//  UserDataService.swift
//  Smack
//
//  Created by Luca Lo Forte on 01/06/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    //é pubblica per leggere, ma non può essere modificata da altre classi
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName : String){
        self.avatarName = avatarName
    }
    
}
