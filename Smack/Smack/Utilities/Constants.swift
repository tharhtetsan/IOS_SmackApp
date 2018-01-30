//
//  Constants.swift
//  Smack
//
//  Created by ths on 1/8/18.
//  Copyright © 2018 ths. All rights reserved.
//

import Foundation

typealias ComplectionHandle = (_ Success : Bool )->()

//MARK: URL Constant
let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD="\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS="\(BASE_URL)channel"
let URL_GET_MESSAGE="\(BASE_URL)message/byChannel/"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]


//Notifications Constants
let NOTIF_USER_DATA_ADD_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_CHANGE = Notification.Name("channelChange")
let NOTIF_CHANNELS_SELSECTED = Notification.Name("channelSelected")

//Colors
let SmackPlaceHolderColor = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)


//MARK: Segues
let TO_LOG_IN = "toLogin_segue"
let TO_CREATE_ACCOUNT = "toCreateAccount_segue"
let UNWIN = "unwinToChannel"
let TO_AAVATAR_PICKER = "ToAvatarPicker"


//MARK:user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL  = "userEmail"

