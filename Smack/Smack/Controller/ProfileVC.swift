//
//  ProfileVC.swift
//  Smack
//
//  Created by ths on 1/17/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var closeModalPress: UIButton!
    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var bdView: UIView!
    
    
    @IBAction func closeModalPressAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func LogoutPressAction(_ sender: Any) {
        UserDataService.instance.logOutUser()
        NotificationCenter.default.post(name : NOTIF_USER_DATA_ADD_CHANGE,object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SetupView()
    {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        userProfile.backgroundColor = UserDataService.instance.returnUIColor(compents: UserDataService.instance.avtarColor)
        userProfile.image = UIImage(named : UserDataService.instance.avtarName)
        
        
        let closeTouch = UITapGestureRecognizer.init(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bdView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer : UITapGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
    

}
