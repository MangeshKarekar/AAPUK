//
//  EventsViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit
import Firebase

class EventsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var eventsTable: UITableView!
    let cellID = "eventsCell"
    var documents: [DocumentSnapshot]?
    let refreshControl = UIRefreshControl()
    let newsdetailsSegue = "newsdetailsSegue"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Events"
        setTable()
        setEvents()
        // Do any additional setup after loading the view.
    }
    
    func setTable(){
        refreshControl.addTarget(self, action: #selector(refreshEvents), for: .valueChanged)
        eventsTable.tableHeaderView = refreshControl
    }
    
    @objc func refreshEvents() {
        setEvents()
        refreshControl.endRefreshing()
        // Code to refresh table view
    }
    
    func setEvents(){
        let defaultStore = Firestore.firestore()
        defaultStore.collection("Events").getDocuments {[weak self] (querySnapShot, error) in
            self?.documents = querySnapShot?.documents
            self?.eventsTable.reloadData()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == newsdetailsSegue{
            let destinationViewController = segue.destination as! NewsDetailsViewController
            let document = sender as? DocumentSnapshot
            destinationViewController.eventsDocument = document
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let documents = documents{
            return documents.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! EventsTableViewCell
        if let documents = documents{
            cell.eventsDocument = documents[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: newsdetailsSegue, sender: documents?[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }

}
