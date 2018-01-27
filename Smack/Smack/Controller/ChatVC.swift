//
//  ChatVC.swift
//  Smack
//
//  Created by ths on 1/4/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
  
    @IBOutlet weak var channelNamelb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:) ), name: NOTIF_USER_DATA_ADD_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(channelSelected(_:)), name: NOTIF_CHANNELS_SELSECTED, object: nil)
        
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(complection: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_ADD_CHANGE, object: nil)
                })
        }
        MessageServices.instance.findAllChannel { (success) in
    }
    }
    
    
    @objc func userDataDidChange(_ notif : Notification)
    {
        if AuthService.instance.isLoggedIn{
         onLoginGetMessages()
            channelNamelb.text = "Smack"
        }
        else
        {
            channelNamelb.text = "Please login...."
        }
    }
    @objc func channelSelected(_ notif : Notification)
    {
        updateWithChannel()
    }
    
    func updateWithChannel()
    {
        let channelName = MessageServices.instance.SelectedChannel?.channelTitle ?? ""
        channelNamelb.text = "\(channelName)"
    }
    
    
    
    func onLoginGetMessages()
    {
        MessageServices.instance.findAllChannel { (success) in
            if success{
                
                if MessageServices.instance.messages.count > 0{
                    MessageServices.instance.SelectedChannel = MessageServices.instance.channels[0]
                    self.updateWithChannel()
                }else
                {
                    self.channelNamelb.text = "No Channel yet!!"
                }
            }
        }
    }
    
    func getMessages()
    {
        guard let channelID = MessageServices.instance.SelectedChannel?.id else {
            return
        }
        MessageServices.instance.findAllMessagesForAllChannel(channelId: channelID) { (success) in
            if success{
                
            }
        }
    }

}
