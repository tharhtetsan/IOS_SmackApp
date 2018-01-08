//
//  LoginVC.swift
//  Smack
//
//  Created by ths on 1/7/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

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
    
}
