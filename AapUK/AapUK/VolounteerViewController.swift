//
//  VolounteerViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 30/10/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

class VolounteerViewController: UIViewController {

   // let sectionTitles = ["Address","Passport", "How would you like to contribute ?"]
    let sections = ["Address": ["Name","Address","Email","Phone"],
                    "Passport": ["Indian","Non Indian"],
                    "How would you like to contribute ?": ["Event","Video for social media","Call campaign","fund raise","Paper design"]]
    var sectionTitles = [String]()
//    let address = ["Name","Address","Email","Phone"]
//    let passport = ["Indian","Non Indian"]
//    let contribution = ["Event","Video for social media","Call campaign","fund raise","Paper design"]

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

}
