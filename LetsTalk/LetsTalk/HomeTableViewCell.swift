//
//  AppDelegate.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 12/04/22.
//


import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var lblUserName: UILabel!
    
    @IBOutlet var imgUserProfile: UIImageView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
