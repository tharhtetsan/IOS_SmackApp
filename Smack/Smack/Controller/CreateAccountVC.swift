//
//  CreateAccountVC.swift
//  Smack
//
//  Created by ths on 1/8/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    
    @IBOutlet weak var userName_textField: UITextField!
    
    @IBOutlet weak var email_textField: UITextField!
    
    @IBOutlet weak var password_textField: UITextField!
    
    @IBOutlet weak var userImage_ImageView: UIImageView!
    
    

    @IBAction func Btn_CreateAccount_Pressed(_ sender: Any) {
        
        guard let email = email_textField.text ,email_textField.text != "" else {return}
        
        guard let password = password_textField.text ,password_textField.text != "" else {return}
        AuthService.instance.registerUSEr(email: email, password: password) { (success) in
            
            if(success)
            {
                print("Register user !!!!!")
            }
        }
        
    }
    @IBAction func Btn_ChooseAvatuar_Pressed(_ sender: Any) {
    }
    @IBAction func Btn_GenerateRGBcolor_pressed(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressBtn_Action(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIN, sender: nil)
    }
    

}
