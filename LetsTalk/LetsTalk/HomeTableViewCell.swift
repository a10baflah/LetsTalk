//
//  AppDelegate.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 12/04/22.
//


import UIKit
//Decorater Pattern
class HomeTableViewCell: UITableViewCell {

    @IBOutlet var lblUserName: UILabel!
    
    @IBOutlet var imgUserProfile: UIImageView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    //Decorator
    //Select cell from table view by overriding the selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
