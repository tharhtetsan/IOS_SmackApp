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

let HEADER = [
    "Content-type":"application/json; charset = utf-8"
]



//MARK: Segues
let TO_LOG_IN = "toLogin_segue"
let TO_CREATE_ACCOUNT = "toCreateAccount_segue"
let UNWIN = "unwinToChannel"
let TO_AAVATAR_PICKER = "ToAvatarPicker"


//MARK:user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL  = "userEmail"

