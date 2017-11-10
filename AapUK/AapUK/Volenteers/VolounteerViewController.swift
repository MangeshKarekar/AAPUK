//
//  VolounteerViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 30/10/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

class VolounteerViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,AddressTableViewCellActions {

    @IBOutlet weak var volounteerTable: UITableView!
    
    let addresses = ["Name","Address","Email","Phone"]
    let passport = [PassportType.indian.rawValue,PassportType.nonIndian.rawValue]
    let contribution =  ["Event","Video for social media","Call campaign","fund raise","Paper design"]
    var sectionTitles = ["Address","Passport","How would you like to contribute ?"]

    var volounteer = Volounteer()

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
    
    //MARK: UITABLE view datasource and delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return addresses.count
        case 1: return passport.count
        case 2: return contribution.count
        default: return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        switch indexPath.section {
        case 0: return getAddressCell(forLabel: addresses[indexPath.row])
        case 1: return getpassportCell(forRow: indexPath.row)
        case 2: return getContributionCell(forRow: indexPath.row)
        default:
            break
        }
        return cell!
    }

    func getAddressCell(forLabel label:String) -> AddressTableViewCell{
        let cell = volounteerTable.dequeueReusableCell(withIdentifier: "addressCell") as! AddressTableViewCell
        cell.label.text = label
        cell.delegate = self
        if label == "Phone"{
            cell.keyboardType = KeyboardType.numeric
        }else{
            cell.keyboardType = KeyboardType.alphabetic
        }
        return cell
    }
    
     func getpassportCell(forRow row: Int) -> UITableViewCell{
        let cell = volounteerTable.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = passport[row]
        
        if volounteer.passport == passport[row]{
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
        
        return cell!
    }
    
    func getContributionCell(forRow row: Int) -> UITableViewCell{
        let cell = volounteerTable.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = contribution[row]
        if volounteer.contribution.contains(contribution[row]){
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: break
        case 1:
            didSelectRowForPassport(row: indexPath.row)
            tableView.reloadSections([1], with: .fade)
        case 2:
            didSelectRowForContribution(row: indexPath.row)
            tableView.reloadSections([2], with: .fade)
        default:
            break
        }
    }
    
    func didSelectRowForPassport(row: Int ){
        volounteer.passport = passport[row]
    }
    
    func didSelectRowForContribution(row: Int ){
        
        if volounteer.contribution.contains(contribution[row]){
            if let index =  volounteer.contribution.index(of: contribution[row]){
                volounteer.contribution.remove(at: index)
            }
        }else{
            volounteer.contribution.append(contribution[row])
        }
    }
    
    //MARK: address cell actions
    
    func addressTableViewCell(didPressDoneWithLabel Label: String?, text: String?) {
        
    }
    
    func addressTableViewCell(didPressNextWithLabel Label: String?, text: String?) {
        
    }
    
}
