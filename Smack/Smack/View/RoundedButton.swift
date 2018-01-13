//
//  RoundedButton.swift
//  Smack
//
//  Created by ths on 1/13/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornserRadius : CGFloat = 5.0{
        didSet{
            self.layer.cornerRadius = cornserRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView()
    {
        self.layer.cornerRadius = cornserRadius
    }
}
