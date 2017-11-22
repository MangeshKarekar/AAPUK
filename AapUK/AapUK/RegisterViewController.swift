//
//  RegisterViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerTable: UITableView!
    

    let passport = [PassportType.indian.rawValue,PassportType.nonIndian.rawValue]
    let userTypes = [UserType.supporter.rawValue,UserType.volunteer.rawValue]

    let contribution =  ["Event","Video for social media","Call campaign","fund raise","Paper design"]
    let contributionSet = Set<String>()
    var sectionTitles = ["User Type","User Details","Passport Type","How would you like to contribute ?"]
    
 
    var users = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func fegisterClicked(_ sender: UIButton){
        
        
    }

}
