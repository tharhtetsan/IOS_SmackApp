//
//  SocketServices.swift
//  Smack
//
//  Created by ths on 1/25/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit
import SocketIO


class SocketServices  : NSObject{
    
    static let instance = SocketServices()
    var socketManager: SocketManager
    
    override init() {
        socketManager = SocketManager(socketURL: URL(string: BASE_URL)!)
        super.init()
    }
    func establishConnection()
    {
        socketManager.defaultSocket.connect()
    }
    
    func closeConnection()
    {
        socketManager.defaultSocket.disconnect()
    }
    
    func addChannel(channelName : String,channelDescription : String, completion : @escaping ComplectionHandle)
    {
         socketManager.defaultSocket.emit("newChannel", channelName,channelDescription)
        completion(true)
    }
    
    func getChannel(completion :@escaping ComplectionHandle)
    {
         socketManager.defaultSocket.on("channelCreated") { (dataArray, ack) in
            
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesciption = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesciption, id: channelId)
            MessageServices.instance.channels.append(newChannel)
            completion(true)
            
            
        }
    }
    
    func addMessage(messageBody : String,userId: String,channelId : String,completion :@escaping ComplectionHandle)
    {
        let user = UserDataService.instance
        socketManager.defaultSocket.emit("newMessage", messageBody,userId,channelId,user.name,user.avtarName,user.avtarColor)
        completion(true)
    }
}

