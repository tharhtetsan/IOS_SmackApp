//
//  CircleImage.swift
//  Smack
//
//  Created by ths on 1/14/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        SetupView()
    }
    func SetupView()
    {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        SetupView()
    }
}
