//
//  UserModel.swift
//  PracProj
//
//  Created by VM on 17/03/23.
//

import Foundation

struct User{
    let name:String?
    let email:String
    let password:String
}

class LocalUserDefault{
    let userDefaults = UserDefaults.standard
    let emailKey = "emailkey"
    let passKey = "passKey"
    let nameKey = "nameKey"
    
    func setUserDetails(newUser: User){
        userDefaults.set(newUser.email, forKey: emailKey)
        userDefaults.set(newUser.password, forKey: passKey)
        userDefaults.set(newUser.name, forKey: nameKey)
    }
    func verifyUserDetail(user:User)-> Bool{
        let email = userDefaults.string(forKey: emailKey)
        let pass = userDefaults.string(forKey: passKey)
        if(email == user.email && pass == user.password){
            return true
        }
        return false

    }
    
    func getUser()-> User{
      let email =  userDefaults.string(forKey: emailKey) ?? ""
     let name =   userDefaults.string(forKey: nameKey) ?? ""
        return User(name: name, email: email, password: "")
    }
//    func getUserDetails()-> User?{
//        return userDefaults.object(forKey: userKey) as? User ?? nil
//    }
    
}


