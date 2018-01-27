//
//  MessageServices.swift
//  Smack
//
//  Created by ths on 1/20/18.
//  Copyright © 2018 ths. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class MessageServices{
    static let instance = MessageServices()
    
    var channels = [Channel]()
    var SelectedChannel : Channel?
    var messages = [Message]()
    
    
    func findAllChannel(completion :@escaping ComplectionHandle)
    {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER  ).responseJSON(completionHandler:  {
            (response) in
            
            if(response.result.error == nil)
            {
                guard let data = response.data else { return }
                do{
                    if let json =  try JSON(data : data).array{
                        
                        for item in json{
                            let name = item["name"].stringValue
                            let channellDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(channelTitle: name, channelDescription:channellDescription, id: id)
                            self.channels.append(channel)
                        }
                        NotificationCenter.default.post(name: NOTIF_CHANNELS_CHANGE, object: nil)
                        completion(true)
                    }
                }catch{
                    debugPrint(response.result.error)
                }
            }
        })
    }
    
    
    
    func findAllMessagesForAllChannel(channelId : String,completion :@escaping ComplectionHandle)
    {
     Alamofire.request("\(URL_GET_MESSAGE)\(channelId)", method: .get
        , parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                self.ClearMessages()
                guard let data = response.data else { return }
                do{
                    if let json  = try JSON(data:data).array{
                        
                        for item in json{
                            let messageBody = item["messageBody"].stringValue
                            let channelId = item["channelId"].stringValue
                            let userName = item["userName"].stringValue
                            let userAvatar = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            let timeStamp = item["timeStamp"].stringValue
                            let id = item["_id"].stringValue
                            
                            let message = Message(message: messageBody, userName: userName, channelId: channelId, useravatarName: userAvatar, useravatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                            self.messages.append(message)
                        }
                        print(self.messages)
                        completion(true)
                    }
                }catch{
                    
                }
                
               
            }else{
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
        
    }
    
    
    func ClearChannels()
    {
        channels.removeAll()
    }
    func ClearMessages()
    {
        messages.removeAll()
    }
}
