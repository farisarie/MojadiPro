//
//  SessionManager.swift
//  MojadiApp
//
//  Created by yoga arie on 17/05/22.
//

import Foundation

class SessionManager{
    
    
    static func isLogin() -> Bool{
           let session = UserDefaults.standard
           return  session.bool(forKey: "isLogin")
           
       }
       
       static func createSession(users: Users){
           let session = UserDefaults.standard
           session.setValue(users.token, forKeyPath: "token")
           session.setValue(true, forKeyPath:  "isLogin")
           session.setValue(users.id, forKey: "idLogin")
           session.setValue(users.token, forKey: "tokenLogin")
           session.setValue(users.email, forKey: "emailLogin")
           session.setValue(users.firstName, forKey: "nameLogin")
           
           session.synchronize()
       }
       
       static func logout(){
           let session = UserDefaults.standard
           session.setValue("", forKey: "token")
           session.setValue(false, forKeyPath: "isLogin")
           
           session.synchronize()
       }
      
       
       static func getToken()->String{
           
           let session = UserDefaults.standard
           return session.string(forKey: "token") ?? ""
       }
}
