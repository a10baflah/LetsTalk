//
//  AppDelegate.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 12/04/22.
//


import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import QuartzCore

class ChatVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var bottomConst: NSLayoutConstraint!
    @IBOutlet var txtMsg: UITextField!
    @IBOutlet var tblChat: UITableView!
    
    var dict:NSDictionary!
    let arrMsg = NSMutableArray()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomConst.constant = 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let senderDisplayName = "\(String(describing: dict.object(forKey: "Firstname")!))"
        title = "Chat: \(senderDisplayName)"
        let database = Database.database().reference()
        database.child("Chats").child(Auth.auth().currentUser!.uid).child("\(String(describing: dict.object(forKey: "firebaseId")!))").observe(.childAdded) { (snapshot) in
            
            let components = snapshot.key.components(separatedBy: "_")
            let dictMsg = NSMutableDictionary()
            dictMsg.setObject(components[1], forKey: "SenderId" as NSCopying)
            dictMsg.setObject(components[2], forKey: "ReceiverId" as NSCopying)
            dictMsg.setObject(snapshot.value!, forKey: "Message" as NSCopying)
            
            self.arrMsg.add(dictMsg)
            self.tblChat.reloadData()
            self.tblChat.separatorStyle = .none
            self.scrollToBottom()
            }
    }
    
    @IBAction func btnActionMsgSend(_ sender: Any) {
        if (txtMsg.text == "" || txtMsg.text == " ") {
            let alert = UIAlertController(title: "Alert", message: "Please type a Message", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let time = timeSingleton()
            let database = Database.database().reference()
            let str =  "\(String(describing: time.getCurrentTimeStamp().replacingOccurrences(of: ".", with: "")))" + "_" + "\(String(describing: Auth.auth().currentUser!.uid))" + "_" + "\(String(describing: dict.object(forKey: "firebaseId")!))"
            
            database.child("Chats").child("\(String(describing: dict.object(forKey: "firebaseId")!))").child(Auth.auth().currentUser!.uid).updateChildValues([str : txtMsg.text!])
            
            database.child("Chats").child(Auth.auth().currentUser!.uid).child("\(String(describing: dict.object(forKey: "firebaseId")!))").updateChildValues([str : txtMsg.text!])
            self.tblChat.reloadData()
            txtMsg.text = " "
        }
    }
    
    @IBAction func backButton()
    {
        if (Auth.auth().currentUser != nil) {
            
            let storyboard = UIStoryboard(name: "HomeSideSB", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeSideVC")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        else
        {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainPage")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
    }
    
//    func getCurrentTimeStamp() -> String {
//            return "\(Double(NSDate().timeIntervalSince1970 * 1000))"
//    }
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.arrMsg.count-1, section: 0)
            self.tblChat.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            bottomConst.constant = (keyboardSize.height) * -1.0
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            bottomConst.constant = 0.0
            self.view.layoutIfNeeded()
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtMsg.resignFirstResponder()
        return true
    }
}
extension ChatVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMsg.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dict1 = arrMsg.object(at: indexPath.row) as! NSDictionary
        
        if((String(describing: dict1.object(forKey: "SenderId")!)) == Auth.auth().currentUser?.uid){
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! Chat2TableViewCell
            cell2.lblSender.text = (dict1.object(forKey: "Message") as! String)
            cell2.lblSender.backgroundColor = UIColor(red: 0.09, green: 0.54, blue: 1, alpha: 1)
            cell2.lblSender.font = UIFont.systemFont(ofSize: 18)
            cell2.lblSender.textColor = UIColor.white
            cell2.lblSender?.layer.masksToBounds = true
            cell2.lblSender.layer.cornerRadius = 7
            return cell2
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ChatTableViewCell
            cell.lblReceiver.text = (dict1.object(forKey: "Message") as! String)
            cell.lblReceiver.backgroundColor = UIColor .lightGray
            cell.lblReceiver.font = UIFont.systemFont(ofSize: 18)
            cell.lblReceiver.textColor = UIColor.white
            cell.lblReceiver?.layer.masksToBounds = true
            cell.lblReceiver.layer.cornerRadius = 7
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
