//
//  AppDelegate.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 11/16/22.
//

import UIKit

class HomeSideVcCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var lblUsername: UILabel!
    @IBOutlet var imgUser: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
