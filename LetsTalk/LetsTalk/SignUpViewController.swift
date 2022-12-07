//
//  SignUpViewController.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 11/16/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import GoogleSignIn

class SignUpViewController: UIViewController {
    
    var name: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    
    let storage = Storage.storage()
    var ref: DatabaseReference!
    let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)

//        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func endEditingName(_ sender: UITextField)
    {
        name = sender.text!
    }
    
    @IBAction func endEditingLastName(_ sender: UITextField)
    {
        lastName = sender.text!
    }
    
    @IBAction func endEditingEmail(_ sender: UITextField)
    {
        email = sender.text!
    }
    
    @IBOutlet var PasswodField: UITextField!
    
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func joinLetsTalk()
    {
        print ("Name: ", name)
        print ("Email: ", email)
        
        var check = false
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
                check = true
            }
            else
            {
                self.ref = Database.database().reference()
//                var data = NSData()
                print("\(user.email!) created")
//                let storageRef = Storage.storage().reference()
                let fullname = ["Firstname": self.name, "Lastname": self.lastName]
                self.ref.child("users").child((Auth.auth().currentUser!.uid)).setValue(["username": fullname])
            }
            
            // [END_EXCLUDE]
        }
        print ("Account Created")
        if check == false
        {
              
                    print("Signed In")
                    let storyboard = UIStoryboard(name: "HomeSideSB", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "HomeSideVC")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                    
        }
        
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
