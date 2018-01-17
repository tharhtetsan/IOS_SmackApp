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
    
    func returnUIColor(compents : String) -> UIColor{
        
        let scanner = Scanner(string: compents)
        let skipped = CharacterSet(charactersIn : "[], ")
        let comma = CharacterSet(charactersIn : ",")
        
        scanner.charactersToBeSkipped = skipped
        var r,g,b,a : NSString?
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma  , into: &a)
        
        let defaultColor = UIColor.lightGray
        guard  let rUnwarped =  r else { return defaultColor}
        guard  let gUnwarped =  g else { return defaultColor}
        guard  let bUnwarped =  b else { return defaultColor}
        guard  let aUnwarped =  a else { return defaultColor}
        
        let rfloat = CGFloat(rUnwarped.doubleValue)
        let gfloat = CGFloat(gUnwarped.doubleValue)
        let bfloat = CGFloat(bUnwarped.doubleValue)
        let afloat = CGFloat(aUnwarped.doubleValue)
        
        
        let newColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        return newColor
    }
    
    func logOutUser()
    {
        id = ""
        name = ""
        avtarName = ""
        avtarColor = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        
    }
}
