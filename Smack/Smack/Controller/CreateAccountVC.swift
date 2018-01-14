//
//  CreateAccountVC.swift
//  Smack
//
//  Created by ths on 1/8/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //MARK : Outlets
    @IBOutlet weak var userName_textField: UITextField!
    
    @IBOutlet weak var email_textField: UITextField!
    
    @IBOutlet weak var password_textField: UITextField!
    
    @IBOutlet weak var userImage_ImageView: UIImageView!
    
    
    
    //MARK : Vaiables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    
    

    @IBAction func Btn_CreateAccount_Pressed(_ sender: Any) {
        
        guard let name = userName_textField.text,userName_textField.text != "" else {return}
        guard let email = email_textField.text ,email_textField.text != "" else {return}
        guard let password = password_textField.text ,password_textField.text != "" else {return}
        
        
        AuthService.instance.registerUSEr(email: email, password: password) { (success) in
            
            if(success)
            {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.CreateUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            
                            if success {
                                self.performSegue(withIdentifier: UNWIN, sender: nil)
                            }
                        })
                    }
                })
            }
        }
        
    }
    @IBAction func Btn_ChooseAvatuar_Pressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AAVATAR_PICKER, sender: nil)
    }
    @IBAction func Btn_GenerateRGBcolor_pressed(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
            if UserDataService.instance.avtarName != ""
            {
                userImage_ImageView.image = UIImage(named : UserDataService.instance.avtarName)
                avatarName = UserDataService.instance.avtarName
        }
    }

    @IBAction func closePressBtn_Action(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIN, sender: nil)
    }
    

}
