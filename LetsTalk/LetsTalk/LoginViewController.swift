//
//  LoginViewController.Swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 11/16/22.
//

import UIKit
import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
//    var emailField: String = ""
    var email: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func endEditing(_ sender: UITextField)
    {
        email = sender.text!
    }
   
    
    @IBOutlet var PasswordField: UITextField!
    
    @IBAction func loginLetsTalk()
    {
        password = PasswordField.text!
        print ("Email: ", email)
        print ("Pass: ", password)
//        print ("Password: \(email))"
        var check=false
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            // [START_EXCLUDE]
            if let error = error
            {
                    let authError = error as NSError
                    if authError.code == AuthErrorCode.secondFactorRequired.rawValue {
                        // The user is a multi-factor user. Second factor challenge is required.
                        let resolver = authError
                            .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
                        var displayNameString = ""
                        for tmpFactorInfo in resolver.hints {
                            displayNameString += tmpFactorInfo.displayName ?? ""
                            displayNameString += " "
                    }
                        check=true
                }
                print(error)
                print("error")

                check=true
                
            }
            
            if check == false{
                        
                        print("Signed In")
                        let storyboard = UIStoryboard(name: "HomeSideSB", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "HomeSideVC")
                        vc.modalPresentationStyle = .fullScreen
                        self?.present(vc, animated: true)
                    }
            
        }
        
        
    }
    
    
//    @IBAction func googleSignInPressed(_ sender: Any) {
//        GIDSignIn.sharedInstance().signIn()
//    }
//
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    //Sign in functionality will be handled here
    }
}
