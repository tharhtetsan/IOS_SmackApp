//
//  MessageCell.swift
//  Smack
//
//  Created by ths on 1/30/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var avatarImage: CircleImage!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func ConfigureCell(message : Message)
    {
        userName.text = message.userName
        time.text = message.timeStamp
        avatarImage.image = UIImage(named : message.useravatarName)
        avatarImage.backgroundColor = UserDataService.instance.returnUIColor(compents: message.useravatarColor)
        messageBody.text = message.message
    
    }
    
}
