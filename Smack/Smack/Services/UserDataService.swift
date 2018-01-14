//
//  UserDataService.swift
//  Smack
//
//  Created by ths on 1/14/18.
//  Copyright © 2018 ths. All rights reserved.
//

import Foundation

class UserDataService{

    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var  avtarName = ""
    public private(set) var avtarColor = ""
    
    func setUserData(id : String, Name : String , Email : String, color : String, avtarName : String)
    {
        self.id = id
        self.name = Name
        self.email = Email
        self.avtarName = avtarName
        self.avtarColor = color
    }
    
    func setAvatarName(avatarName : String)
    {
        self.avtarName = avatarName
    }
}
