//
//  nullObjectUser.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 12/6/22.
//


//Null Object Pattern

import Foundation



import Foundation

struct User {
    let firstName: String
    let lastName: String
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

class ViewControllerPlacehold {
    var user: User?
    
    func viewDidLoadOrSomeOtherMethod() {
        if let user = user {
            print("rendering UI for the user since we clearly have one")
            print("user's full name is: \(user.fullName())")
        } else {
            print("rendering UI for no-user case")
            print("Hi no-user, you should really sign in!")
        }
    }
}



