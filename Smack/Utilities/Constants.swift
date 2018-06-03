//
//  Constants.swift
//  Smack
//
//  Created by Luca Lo Forte on 30/05/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import Foundation

//Ci permette di rinominare un tipo
typealias CompletionHandler = (_ Success: Bool) -> () //In questo modo abbiamo creato una custom closure

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toRegisterAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//Colors
let smackPurplePlaceHolder = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//API URL
let BASE_URL = "https://smack-chattychat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//Header
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
