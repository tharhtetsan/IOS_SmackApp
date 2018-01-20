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
                        print(self.channels[0].channelDescription)
                        completion(true)
                    }
                }catch{
                    debugPrint(response.result.error)
                }
            }
        })
    }
}
