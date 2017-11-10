//
//  SupporterViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 30/10/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

class SupporterViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,AddressTableViewCellActions {

    @IBOutlet weak var suppoerterTable: UITableView!

    let addresses = ["Name","Address","Email","Phone"]
    let passport = [PassportType.indian.rawValue,PassportType.nonIndian.rawValue]
    var sectionTitles = ["Address","Passport"]
    
    var supporter = Supporter()

    
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
        default: return 0
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        switch indexPath.section {
        case 0: return getAddressCell(forLabel: addresses[indexPath.row])
        case 1: return getpassportCell(forRow: indexPath.row)
        default:
            break
        }
        return cell!
    }
    
    func getAddressCell(forLabel label:String) -> AddressTableViewCell{
        let cell = suppoerterTable.dequeueReusableCell(withIdentifier: "addressCell") as! AddressTableViewCell
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
        let cell = suppoerterTable.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = passport[row]
        if supporter.passport == passport[row]{
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
        default:
            break
        }
    }
    
    func didSelectRowForPassport(row: Int ){
        supporter.passport = passport[row]
    }
    
    //MARK: address cell actions
    
    func addressTableViewCell(didPressDoneWithLabel Label: String?, text: String?) {
        
    }
    
    func addressTableViewCell(didPressNextWithLabel Label: String?, text: String?) {
        
    }
}
