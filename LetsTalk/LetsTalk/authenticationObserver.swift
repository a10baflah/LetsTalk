//
//  authenticationObserver.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 12/6/22.
//

//Observer Pattern


import Foundation

import FirebaseAuth




//Observer
protocol UserInfo
{
    var id: Int {get}
    func update(bLog : Float)
}

//Subject
class LoggedInVerify
{
    var loggers = [UserInfo]()

    func receiveLog (bLog: Float) {
        notifyLogger(log: bLog)
    }
    
    func register(logger: UserInfo){
        loggers.append(UserInfo.self as! UserInfo)
    }
    
    func notifyLogger(log: Float){
        for logger in loggers
        {
            logger.update(bLog: log)
        }
    }
    
    func deregister(logger: UserInfo)
    {
        if let toRemove = loggers.enumerated().first(where: { $0.element.id == logger.id })
        {
            loggers.remove(at: toRemove.offset)
        }
    }
}

class OnlineLogger : UserInfo
{
    var id: Int
    
    private var subject : LoggedInVerify
    init(subject : LoggedInVerify, id: Int) {
        self.id = id
        self.subject = subject
        self.subject.register(logger: self)

    }
    func update(bLog: Float) {
        //ecide whether to log in or no, and press the computer
        print ("Decide whether to update")
        print ("Type false: bLog | > \(bLog)")
    }
}


