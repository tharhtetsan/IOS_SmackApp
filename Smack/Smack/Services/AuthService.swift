//
//  AuthService.swift
//  Smack
//
//  Created by ths on 1/13/18.
//  Copyright © 2018 ths. All rights reserved.
//

import Foundation
import Alamofire

class AuthService{
    
    static let instance = AuthService()
    let defaults = UserDefaults.standard
    
    
    var isLoggedIn : Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String{
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUSEr(email : String, password : String,completion : @escaping ComplectionHandle){
        
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-type":"application/json; charset = utf-8"
        ]
        
        let body : [String : Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).response { (response) in
            if(response.error == nil)
            {
                completion(true)
            }
            else{
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
}
