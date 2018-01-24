//
//  AddChannelsViewController.swift
//  Smack
//
//  Created by ths on 1/24/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class AddChannelsViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CloseModalPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CreatBtnPress(_ sender: Any) {
    }
    
    
    func setupView()
    {
        let colseTap = UITapGestureRecognizer.init(target: self, action: #selector(closeTap(_:)))
        bgView.addGestureRecognizer(colseTap)
        nameTextField.attributedPlaceholder = NSAttributedString(string : "name",attributes : [NSAttributedStringKey.foregroundColor : SmackPlaceHolderColor])
         descriptionTextField.attributedPlaceholder = NSAttributedString(string : "description",attributes : [NSAttributedStringKey.foregroundColor : SmackPlaceHolderColor])
    }
    
    @objc func closeTap(_ recognizer : UITapGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
    

}
