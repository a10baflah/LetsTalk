//
//  AppDelegate.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 11/16/22.
//

import FirebaseCore
import FirebaseAuth
import UIKit
import CoreData
import Firebase
import FirebaseMessaging
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        Messaging.messaging().isAutoInitEnabled = true
        Messaging.messaging().delegate = self as? MessagingDelegate
        FirebaseApp.configure()
        
        if (Auth.auth().currentUser != nil) {
            
            self.sideMenu()
//            let navMain = objHomeSideSB.instantiateViewController(withIdentifier: "navHomeSide") as! UINavigationController
        }
        else
        {
            //Using Observer Pattern
            let loginVerify = LoggedInVerify()
            let loggerMain = OnlineLogger(subject: loginVerify, id: 1)
            self.sideMenu()
            
        }
        return true
    }
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String)
    {
        print("Firebase registration token: \(fcmToken)")
        
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    }
    
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        return ApplicationDelegate.shared.application(application, open: (url as URL?)!, sourceApplication: sourceApplication, annotation: annotation)
//    }
    
    func logOutSuccess() -> Void {
       
        let test = objMainSB.instantiateViewController(withIdentifier: "mainPage") as! UINavigationController
        self.window?.rootViewController = test
    }
    func sideMenu() -> Void {
        
//        let leftVC = objProfileSB.instantiateViewController(withIdentifier: "ProfileVC")
//        leftVC.view.backgroundColor = UIColor(white: 1.0, alpha: 1)
        
//          let navMain = objHomeSideSB.instantiateViewController(withIdentifier: "navHomeSide") as! UINavigationController
        
//        objSideMenu = MFSideMenuContainerViewController.container(withCenter: navMain, leftMenuViewController: leftVC, rightMenuViewController: nil)
//
        
//        self.window?.rootViewController = objSideMenu;
        
        
        self.window?.makeKeyAndVisible()
    }
 
//    func showSideMenu() -> Void {
//        objSideMenu.toggleLeftSideMenuCompletion {}
//    }
    func test()
    {
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

