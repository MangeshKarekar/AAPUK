//
//  NewsTableViewCell.swift
//  AapUK
//
//  Created by Mangesh Karekar on 10/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit
import Firebase
import Nuke

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var previewLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    var newsDocument: DocumentSnapshot?{
        didSet{
            if let newsDocument = newsDocument{
                setNews(forDocument: newsDocument)
            }
        }
    }
    
    var eventsDocument: DocumentSnapshot?{
        didSet{
            if let eventsDocument = eventsDocument{
                setEvent(forDocument: eventsDocument)
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
        titleLabel.text = data["title"] as? String
        previewLabel.text = data["preview"] as? String
        dateLabel.text = data["date"] as? String
        setImage(forLink: data["imageSource"] as? String)
    }
    
    func setImage(forLink link: String?){
        if let link = link, let url = URL(string:link){
            let request = Request(url: url)
            Nuke.loadImage(with: request, into: newsImageView)
        }
    }
    
    func setEvent(forDocument document:DocumentSnapshot){
        let data = document.data()
        titleLabel.text = data["title"] as? String
        previewLabel.text = data["preview"] as? String
        dateLabel.text = data["date"] as? String
      //  setImage(forLink: data["imageSource"] as? String)
    }
    
    func setImage(forBase64 string: String?){
       
        
    }
}
