//
//  ChannelVC.swift
//  Smack
//
//  Created by ths on 1/4/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var Login_Button: UIButton!
    @IBAction func prepareForUnwin(Segue: UIStoryboardSegue){
    
    }
    @IBAction func LoginBtn_Action(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: TO_LOG_IN, sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-60
        // Do any additional setup after loading the view.
    }


}
