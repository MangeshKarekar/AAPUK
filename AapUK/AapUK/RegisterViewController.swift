//
//  RegisterViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,DetailTableViewCellActions {
    
    @IBOutlet weak var registerTable: UITableView!
    

    let passport = [PassportType.indian.rawValue,PassportType.nonIndian.rawValue]
    let userTypes = [UserType.supporter.rawValue,UserType.volunteer.rawValue]
    
    let contribution =  ["Event","Video for social media","Call campaign","fund raise","Paper design"]
    var sectionTitles = ["User Type","User Details","Passport Type","How would you like to contribute ?"]
    
 
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return userTypes.count
        case 1: return 1
        case 2: return passport.count
        case 3: return contribution.count
        default: return 0
        }
        
    }
    
    let cellID = "cell"
    let detailCellID = "detailsCell"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return getCellForUserType(indexPath: indexPath)
        case 1: return getCellUserDetails(indexPath: indexPath)
        case 2: return getCellForPassport(indexPath: indexPath)
        case 3: return getCellForContribution(indexPath: indexPath)
        default: return tableView.dequeueReusableCell(withIdentifier: cellID)!
        }
    }
    
    func getCellForUserType(indexPath: IndexPath) -> UITableViewCell{
        let cell = registerTable.dequeueReusableCell(withIdentifier: cellID)!
        let usertypeText = userTypes[indexPath.row]
        cell.textLabel?.text = usertypeText
        if usertypeText == user.userType{
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    func getCellUserDetails(indexPath: IndexPath) -> UITableViewCell{
        let cell = registerTable.dequeueReusableCell(withIdentifier: detailCellID) as! DetailsTableViewCell
        cell.delegate = self
        return cell
    }
    
    func getCellForPassport(indexPath: IndexPath) -> UITableViewCell{
        let cell = registerTable.dequeueReusableCell(withIdentifier: cellID)!
        let passportText = passport[indexPath.row]
        cell.textLabel?.text = passportText
        if passportText == user.passport{
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        return cell
    }

    func getCellForContribution(indexPath: IndexPath) -> UITableViewCell{
        let cell = registerTable.dequeueReusableCell(withIdentifier: cellID)!
        let contributionText = contribution[indexPath.row]
        cell.textLabel?.text = contributionText
        if user.contribution.contains(contributionText){
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: didSelectForUserType(indexPath: indexPath)
        case 1: break
        case 2: didSelectForPassport(indexPath: indexPath)
        case 3: didSelectForContribution(indexPath: indexPath)
        default: break
        }
    }
    
    func didSelectForUserType(indexPath: IndexPath){
        user.userType = userTypes[indexPath.row]
        registerTable.reloadSections([0], with: .fade)
    }
    
    func didSelectForPassport(indexPath: IndexPath){
        user.passport = passport[indexPath.row]
        registerTable.reloadSections([2], with: .fade)
    }
    
    func didSelectForContribution(indexPath: IndexPath){
        let contributionText = contribution[indexPath.row]
        if user.contribution.contains(contributionText){
            if let indexToRemove = user.contribution.index(of: contributionText){
                user.contribution.remove(at: indexToRemove)
            }
        }else{
            user.contribution.insert(contributionText)
        }
        registerTable.reloadSections([3], with: .fade)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Deatils tableview cell deleagte
    
    func detailsCell(didPressDoneWithName name: String?, address: String?, email: String?, phone: String?) {
        user.name = name
        user.address = address
        user.email = email
        user.phone = phone
    }
    
    @IBAction func registerClicked(_ sender: UIButton){
        
        
    }

}
