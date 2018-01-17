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
    
    @IBOutlet weak var spinnner: UIActivityIndicatorView!
    
    
    //MARK : Vaiables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    var bgColor : UIColor!
    

    @IBAction func Btn_CreateAccount_Pressed(_ sender: Any) {
        spinnner.isHidden = false
        spinnner.startAnimating()
        
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
                               
                                self.spinnner.isHidden = true
                                self.spinnner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIN, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_ADD_CHANGE, object: nil)
                                AuthService.instance.isLoggedIn = true
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
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b),1]"
        UIView.animate(withDuration: 0.2)
        {
            self.userImage_ImageView.backgroundColor = self.bgColor
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
            if UserDataService.instance.avtarName != ""
            {
                userImage_ImageView.image = UIImage(named : UserDataService.instance.avtarName)
                avatarName = UserDataService.instance.avtarName
                
                if avatarName.contains("light") && bgColor == nil {
                    userImage_ImageView.backgroundColor = UIColor.lightGray
                }
        }
    }

    @IBAction func closePressBtn_Action(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIN, sender: nil)
    }
    
    func SetUpView()
    {
        userName_textField.attributedPlaceholder = NSAttributedString(string : "username",attributes : [NSAttributedStringKey.foregroundColor : SmaclPlaceHolderColor])
        email_textField.attributedPlaceholder = NSAttributedString(string : "email",attributes : [NSAttributedStringKey.foregroundColor : SmaclPlaceHolderColor])
        password_textField.attributedPlaceholder = NSAttributedString(string : "password",attributes : [NSAttributedStringKey.foregroundColor : SmaclPlaceHolderColor])
        

        let tap = UITapGestureRecognizer(target : self , action : #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func  handleTap()
    {
        view.endEditing(true)
    }
    

}
