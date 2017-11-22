//
//  User.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import Foundation
import Firebase
public enum PassportType: String{
    case indian = "Indian"
    case nonIndian = "Non Indian"
}

public enum UserType: String{
    case supporter = "supporter"
    case volunteer = "volunteer"
}


class User{
    var name: String?
    var address: String?
    var email: String?
    var phone: String?
    var userType: String?
    var passport: String?
    var contribution = [String]()
   // var contribution = Set<String>()
    
    private let userCollection = "users"
    private let defaultStore = Firestore.firestore()
    
    func addToFireStore(completion:@escaping (_ error: Error?)->Void){
        
        
        let documentToAdd: [String: Any] = [
            "name" : name as! String,
            "address" : address as! String,
            "userType" : userType as! String,
            "phone" : phone as! String,
            "email" : email as! String,
            "passport" : passport as! String,
            "contribution" : contribution
        ]
        
//        let documentToAdd: [String: Any] = [
//            "name" : name as Any,
//            "address" : address as Any,
//            "userType" : userType as Any,
//            "phone" : phone as Any,
//            "email" : email as Any,
//            "passport" : passport as Any,
//            "contribution" : contribution as Any
//
//        ]
        
        defaultStore.collection(userCollection).addDocument(data: documentToAdd) {(error) in
            completion(error)
        }
        
    }
}
