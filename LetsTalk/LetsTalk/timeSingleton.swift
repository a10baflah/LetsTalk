//
//  timeSingleton.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 12/6/22.
//

//Singleton Pattern
import Foundation


class timeSingleton {
    
     static let shared = timeSingleton()
    
    init(){}
    

    func getCurrentTimeStamp() -> String
    {
        
        print("Timestamp recorded")
        return "\(Double(NSDate().timeIntervalSince1970 * 1000))"
    }

}
