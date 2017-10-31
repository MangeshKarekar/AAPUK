//
//  VolounteerViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 30/10/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

class VolounteerViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var volounteerTable: UITableView!
    
   // let sectionTitles = ["Address","Passport", "How would you like to contribute ?"]
    let sections = ["Address": ["Name","Address","Email","Phone"],
                    "Passport": ["Indian","Non Indian"],
                    "How would you like to contribute ?": ["Event","Video for social media","Call campaign","fund raise","Paper design"]]
    var sectionTitles = [String]()
    var sectionIndexes = [Int]()
//    let address = ["Name","Address","Email","Phone"]
//    let passport = ["Indian","Non Indian"]
//    let contribution = ["Event","Video for social media","Call campaign","fund raise","Paper design"]

    override func viewDidLoad() {
        super.viewDidLoad()
        sectionTitles = [String] (sections.keys)
        sectionIndexes = [Int](sectionTitles.indices)
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
        return sectionIndexes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionObjects = sections[sectionTitles[section]]{
            return sectionObjects.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        switch indexPath.section {
        case 0: return getAddressCell(forLabel: sections[sectionTitles[0]]![indexPath.row])
        case 1: cell?.textLabel?.text = sections[sectionTitles[1]]![indexPath.row]
        case 2: cell?.textLabel?.text = sections[sectionTitles[2]]![indexPath.row]
        default:
            break
        }
        
        return cell!
        
    }

    func getAddressCell(forLabel label:String) -> AddressTableViewCell{
        let cell = volounteerTable.dequeueReusableCell(withIdentifier: "addressCell") as! AddressTableViewCell
        cell.label.text = label
        if label == "Phone"{
            cell.keyboardType = KeyboardType.numeric
        }else{
            cell.keyboardType = KeyboardType.alphabetic
        }
        return cell
    }
}
