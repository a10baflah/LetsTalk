//
//  AppDelegate.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 12/04/22.
//

import UIKit

class Chat2TableViewCell: UITableViewCell {

    @IBOutlet var lblSender: UILabel!
    
    @IBOutlet var imgSender: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
