//
//  NewsDetailTableViewCell.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit
import Firebase

class NewsDetailTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var details: UILabel!

    @IBOutlet var contactInfo: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var time: UILabel!

    var eventsDocument: DocumentSnapshot?{
        didSet{
            if let eventsDocument = eventsDocument{
                setEvent(forDocument: eventsDocument)
            }
        }
    }
    
    var newsDocument: DocumentSnapshot?{
        didSet{
            if let newsDocument = newsDocument{
                setNews(forDocument: newsDocument)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func setNews(forDocument document:DocumentSnapshot){
        let data = document.data()
        title.text = data["title"] as? String
        details.text = data["body"] as? String
        
        contactInfo.text = ""
        location.text = ""
        time.text = ""

    }
    
    func setEvent(forDocument document:DocumentSnapshot){
        let data = document.data()
        title.text = data["title"] as? String
        contactInfo.text = data["contact info"] as? String
        location.text = data["location"] as? String
        time.text = data["time"] as? String
        details.text = data["details"] as? String
    }

}
