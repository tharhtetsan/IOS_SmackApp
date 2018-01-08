//
//  CreateAccountVC.swift
//  Smack
//
//  Created by ths on 1/8/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressBtn_Action(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIN, sender: nil)
    }
    

}
