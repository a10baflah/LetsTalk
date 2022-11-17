//
//  SignUpViewController.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 11/16/22.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn

class SignUpViewController: UIViewController {
    
    var name: String = ""
    var email: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func endEditingName(_ sender: UITextField)
    {
        name = sender.text!
    }
   
    @IBAction func endEditingEmail(_ sender: UITextField)
    {
        email = sender.text!
    }
    
    @IBOutlet var PasswodField: UITextField!
    
//    @IBAction func endEditingPass(_ sender: UITextField)
//    {
//        password = sender.text!
//    }
    
    
    @IBAction func joinLetsTalk()
    {
        print ("Name: ", name)
        print ("Email: ", email)
        
        
        password = PasswodField.text!
        print ("Pass: ", password)
        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
            // [START_EXCLUDE]
              guard let user = authResult?.user, error == nil else {
                return
              }
            if (error != nil)
            {
                print("error")
            }
            else
            {
                print("\(user.email!) created")
            }
            // [END_EXCLUDE]
        }
        print ("Account Created")
        // Success
    }
    
//    func createAccount(email: String, password: String)
//    {
////        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
////            // [START_EXCLUDE]
////              guard let user = authResult?.user, error == nil else {
////                return
////              }
////            if (error != nil)
////            {
////                print("error")
////            }
////            else
////            {
////                print("\(user.email!) created")
////            }
////            // [END_EXCLUDE]
////        }
////        print ("Account Created")
////        // Success
//    }
    
    
    
}
