//
//  AppDelegate.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 11/16/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var lblReceiver: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

