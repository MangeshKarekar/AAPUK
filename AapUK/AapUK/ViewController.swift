//
//  ViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 25/10/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var users: [DocumentSnapshot]?
    let loadTabbar = "loadTabbar"
    let userKey = "user"
    let passwordKey = "password"
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
       // checkIfUserExists()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func checkIfUserExists(){
        if let username = UserDefaults.standard.object(forKey: userKey) as? String,
            let password = UserDefaults.standard.object(forKey: passwordKey) as? String{
            verifyUser(withuserName: username, password: password)
            
        }
            
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // getUsers()
       // checkIfUserExists()
    }
    
    func getUsers(){
        let defaultStore = Firestore.firestore()
        defaultStore.collection("users").getDocuments {[weak self] (querySnapShot, error) in
            self?.users = querySnapShot?.documents
            self?.checkIfUserExists()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginPressed(_ sender: Any){
        
        if let username = UserDefaults.standard.object(forKey: userKey) as? String,
            let password = UserDefaults.standard.object(forKey: passwordKey) as? String{
            verifyUser(withuserName: username, password: password)
            return
        }
        
        
        let alertController = UIAlertController(title: "Login", message: "", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Ok", style: .default, handler: {[weak self]
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            if let username = firstTextField.text, let password = secondTextField.text{
                self?.verifyUser(withuserName: username, password: password)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "username"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    private func verifyUser(withuserName username:String, password:String){
        
        if let users = users{
            for user in users{
                let name = user["user"] as! String
                let namePassword = user["password"] as! String

                if (name == username && namePassword == password ){
                    UserDefaults.standard.set(name, forKey: userKey)
                    UserDefaults.standard.set(password, forKey: passwordKey)
                    self.performSegue(withIdentifier: loadTabbar, sender: nil)
                }else{
                    showUserError()
                }
            }
        }
    }
    
    func showUserError(){
        let alertController = UIAlertController(title: "Error", message: "Error logging in", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

