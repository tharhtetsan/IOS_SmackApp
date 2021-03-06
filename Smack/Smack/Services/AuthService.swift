//
//  AuthService.swift
//  Smack
//
//  Created by ths on 1/13/18.
//  Copyright © 2018 ths. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
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
            guard let token : String = defaults.value(forKey: TOKEN_KEY) as? String else {
                return "token"
            }
            return token
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
        
       
        
        let body : [String : Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).response { (response) in
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
    
    
    func loginUser(email : String, password : String,completion : @escaping ComplectionHandle)
    {
            let lowerCaseEmail = email.lowercased()
        
            let body :[String : Any] = [
                "email" : lowerCaseEmail,
                "password" : password
            ]
        
            Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON(completionHandler: { (response) in
                if response.result.error == nil{
                    //Using Swifty JSON
                    guard let dataToParse  = response.data else { return }
                    do{
                        let json = try JSON(data: dataToParse)
                        self.userEmail = json["user"].stringValue
                        self.authToken = json["token"].stringValue
                        
                        self.isLoggedIn = true
                    }catch{
                       debugPrint(response.result.error)
                    }
                   
                 completion(true)
                }else
                {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            })
    }
    
    func CreateUser(name : String,email : String,avatarName :String , avatarColor : String,completion : @escaping ComplectionHandle)
    {
       let lowerCaseEmail = email.lowercased()
        let body :[String : Any] = [
            "name" : name,
            "email" : lowerCaseEmail,
            "avatarName" : avatarName,
            "avatarColor" : avatarColor
        ]
        let header = [
            "Authorization" : "Bearer \(AuthService.instance.authToken)",
            "Content-type":"application/json; charset = utf-8"
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil{
                guard let data = response.data else { return  }
                
                    do{
                         let json = try  JSON(data : data)
                        guard let dataNew = response.data else{ return}
                        self.setUserInfo(data: dataNew)
                       
                        completion(true)
                        
                        
                    }catch{
                        
                    }
                
            }else
            {
                completion(false)
                debugPrint(response.result.error)
            }
        }
    }
    
    
    func findUserByEmail(complection :@escaping ComplectionHandle)
    {
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON{ (response) in
            
            if response.result.error == nil{
                guard let dataNew = response.data else{ return}
                self.setUserInfo(data: dataNew)
                    complection(true)
                
            }
            else
            {
                complection(false)
                debugPrint(response.result.error as Any)
            }
            
        }
    }
    
    func setUserInfo(data : Data)
    {   do{
        let json = try JSON(data : data)
        let id = json["_id"].stringValue
        let color = json["avatarColor"].stringValue
        let avatorName = json["avatarName"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        
    
        UserDataService.instance.setUserData(id: id, Name: name, Email: email, color: color, avtarName: avatorName)
    }catch{
        
        }
    }
 
  
    
    
}

