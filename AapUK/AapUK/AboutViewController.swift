//
//  AboutViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 09/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit
import SafariServices
class AboutViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var aboutTable: UITableView!
    let aboutRows = [0:"Facebook",1:"Web"]
    
    let links = ["http://www.facebook.com/AAPUnitedKingdom",
                 "http://www.aapuk.org/"]
    
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
        return aboutRows.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = aboutRows[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openLinkInSafari(links[indexPath.section])
    }

    func openLinkInSafari(_ urlString: String){
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let safariView = SFSafariViewController(url: url)
        self.present(safariView, animated: true, completion: nil)
    }
}
