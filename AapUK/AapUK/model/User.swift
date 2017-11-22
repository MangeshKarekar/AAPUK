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

public enum RegistrationError: Error{
    
    case userExists
    case noName
    case noAddress
    case noEmail
    case noPhone
    case noPassport
    case noContribution
    case noUserType
    
}


class User{
    var name: String?
    var address: String?
    var email: String?
    var phone: String?
    var userType: String?
    var passport: String?
    var contribution = [String]()
    
    private let userCollection = "users"
    
    func addToFireStore(completion:@escaping (_ error: Error?)->Void){
        
        
        guard let name = name else{
            completion(RegistrationError.noName)
            return
        }
        
        guard let address = address else{
            completion(RegistrationError.noAddress)
            return
        }
        
        guard let userType = userType else{
            completion(RegistrationError.noUserType)
            return
        }
        
        guard let phone = phone else{
            completion(RegistrationError.noPhone)
            return
        }
        
        guard let email = email else{
            completion(RegistrationError.noEmail)
            return
        }
        
        guard let passport = passport else{
            completion(RegistrationError.noPassport)
            return
        }
        
        if (userType == UserType.volunteer.rawValue && contribution.count == 0){
            completion(RegistrationError.noContribution)
            return
        }
        
        let documentToAdd: [String: Any] = [
            "name" : name as String,
            "address" : address as String,
            "userType" : userType as String,
            "phone" : phone as String,
            "email" : email as String,
            "passport" : passport as String,
            "contribution" : contribution
        ]
        
        let defaultStore = Firestore.firestore()
        
        defaultStore.collection(userCollection).getDocuments {[weak self] (querySnapShot, error) in
            if  let documents = querySnapShot?.documents{
                for document in documents{
                    if (email == document.data()["email"] as? String){
                        completion(RegistrationError.userExists)
                        return
                    }
                }
            }
            
            self?.save(documentToAdd, inStore: defaultStore, completion: completion)
        }
        

    }
    
    private func save(_ document: [String: Any], inStore store: Firestore,completion:@escaping (_ error: Error?)->Void){
        
        store.collection(userCollection).addDocument(data: document) { (error) in
            completion(error)
        }
    }
    
}
