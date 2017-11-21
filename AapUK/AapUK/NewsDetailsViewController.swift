//
//  NewsDetailsViewController.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit
import Firebase
import Nuke

class NewsDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var detailsTable: UITableView!
    let cellID = "cell"
    
    var newsDocument: DocumentSnapshot?
    var eventsDocument: DocumentSnapshot?

    var imageToDisplay: UIImage?
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)!
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textAlignment  = .center
        cell.detailTextLabel?.numberOfLines = 0
        if newsDocument != nil{
            cell.textLabel?.text = newsDocument?["title"] as? String
            cell.detailTextLabel?.text = newsDocument?["body"] as? String
            setImage(forLink: newsDocument?["imageSource"] as? String)
        }
        
        if eventsDocument != nil{
            cell.textLabel?.text = eventsDocument?["title"] as? String
            cell.detailTextLabel?.text = eventsDocument?["details"] as? String
            DispatchQueue.global().async {[weak self] in
                self?.setImage(forBase64: self?.eventsDocument?["imageSource"] as? String)
            }
        }
        
        return cell
        
    }

    func setImage(forLink link: String?){
        if let link = link, let url = URL(string:link){
            let request = Request(url: url)
            Nuke.loadImage(with: request, into: backgroundImage)
        }
    }
    
    func setImage(forBase64 string: String?){
        if let string = string,
            let data = Data(base64Encoded: string, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
        {
            DispatchQueue.main.async {[weak self] in
                self?.backgroundImage.image = UIImage(data: data)
            }
        }
    }
}
