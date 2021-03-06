//
//  NewsViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 09/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit
import Firebase

class NewsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var newsTable: UITableView!
    let cellID = "newsCell"
    var documents: [DocumentSnapshot]?
    let refreshControl = UIRefreshControl()
    let newsdetailsSegue = "newsdetailsSegue"

    let firstTimeBootKey = "firstTimeBootKey"
    let joinUsSegue = "joinUsSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        setTable()
       setNews()
        checkFirstTimeBoot()
        // Do any additional setup after loading the view.
    }
    
    func checkFirstTimeBoot(){
        
        if let _ = UserDefaults.standard.value(forKey: firstTimeBootKey) as? Bool{
        }else{
            self.performSegue(withIdentifier: joinUsSegue, sender: nil)

        }
        
    }
    
    func setTable(){
        
        refreshControl.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
        newsTable.tableHeaderView = refreshControl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func refreshNews() {
        setNews()
        refreshControl.endRefreshing()
        // Code to refresh table view
    }
    
    func setNews(){
        let defaultStore = Firestore.firestore()
        defaultStore.collection("News").getDocuments {[weak self] (querySnapShot, error) in
            self?.documents = querySnapShot?.documents
            self?.newsTable.reloadData()
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == newsdetailsSegue{
            let destinationViewController = segue.destination as! NewsDetailsViewController
            let document = sender as? DocumentSnapshot
            destinationViewController.newsDocument = document
        }
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "News Feed"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let documents = documents{
            return documents.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! NewsTableViewCell
        if let documents = documents{
            cell.newsDocument = documents[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: newsdetailsSegue, sender: documents?[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

}
