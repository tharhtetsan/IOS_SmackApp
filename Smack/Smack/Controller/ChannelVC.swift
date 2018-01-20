//
//  ChannelVC.swift
//  Smack
//
//  Created by ths on 1/4/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  MessageServices.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = channelTableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell{
            
            let channel = MessageServices.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        }else
        {
            return UITableViewCell()
        }
    }
    
   
    
    
    //MARK: Outlets
    @IBOutlet weak var Login_Button: UIButton!
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var channelTableView: UITableView!
    
    
    @IBAction func prepareForUnwin(Segue: UIStoryboardSegue){
    
    }
    
    
    @IBAction func LoginBtn_Action(_ sender: UIButton) {
        
       
        if AuthService.instance.isLoggedIn{
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
           
        }else{
           performSegue(withIdentifier: TO_LOG_IN, sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        channelTableView.delegate = self as! UITableViewDelegate
        channelTableView.dataSource = self
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-60
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIF_USER_DATA_ADD_CHANGE, object: nil)
        
      
        
    }
    
    @objc func userDataDidChange(_ notif : Notification)
    {
        if AuthService.instance.isLoggedIn{
            Login_Button.setTitle(UserDataService.instance.name, for: .normal)
                userImage.image = UIImage(named : UserDataService.instance.avtarName)
                userImage.backgroundColor = UserDataService.instance.returnUIColor(compents: UserDataService.instance.avtarColor)
        }else
        {
            Login_Button.setTitle("Login", for: .normal)
            userImage.image = UIImage(named : "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
            
        }
    }


}
