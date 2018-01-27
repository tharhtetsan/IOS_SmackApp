//
//  LoginVC.swift
//  Smack
//
//  Created by ths on 1/7/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: Outletss
    @IBOutlet weak var passwordTextFiedl: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginSpinner: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    //MARK: Actions
    @IBAction func LoginCloseBtn_Action(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CreateAccount_Action(_ sender: UIButton) {
        
       performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func LoginInAction(_ sender: Any) {
        loginSpinner.isHidden = false
        loginSpinner.startAnimating()
        
        
        guard var Useremail : String = emailTextField.text as! String ,emailTextField.text != "" else {
        return
        }
        guard var Userpassword : String = passwordTextFiedl.text as! String, passwordTextFiedl.text != "" else {
            return
        }
        
        
        
        AuthService.instance.loginUser(email: Useremail, password: Userpassword) { (success) in
            if success{
                AuthService.instance.findUserByEmail(complection: { (success
                    ) in
                    if success {
                          NotificationCenter.default.post(name: NOTIF_USER_DATA_ADD_CHANGE, object: nil)
                        self.loginSpinner.isHidden = true
                        self.loginSpinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                      
                    }
                })
               
            }
        }
        
    }
    
}
