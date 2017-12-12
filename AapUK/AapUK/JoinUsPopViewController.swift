//
//  JoinUsPopViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

class JoinUsPopViewController: UIViewController {

    @IBOutlet weak var laterButton: UIButton!

    let firstTimeBootKey = "firstTimeBootKey"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = UserDefaults.standard.value(forKey: firstTimeBootKey) as? Bool{
            laterButton.isHidden = true
        }else{
            UserDefaults.standard.set(true, forKey: firstTimeBootKey)
            laterButton.isHidden = false
        }
        
        
//        if showLater{
//            laterButton.isHidden = true
//        }else{
//            laterButton.isHidden = false
//        }
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
    
    @IBAction func doItLaterTapped(_ sender: UIButton){
        
        self.dismiss(animated: true, completion: nil)
    
    }

}
