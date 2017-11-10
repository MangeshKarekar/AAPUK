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
    
    var document: DocumentSnapshot?{
        didSet{
            if let document = document{
                setData(forDocument: document)
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
    

    func setData(forDocument document:DocumentSnapshot){
        let data = document.data()
        titleLabel.text = data["title"] as? String
        previewLabel.text = data["preview"] as? String
        setImage(forLink: data["imageSource"] as? String)
    }
    
    func setImage(forLink link: String?){
        if let link = link, let url = URL(string:link){
            let request = Request(url: url)
            Nuke.loadImage(with: request, into: newsImageView)
        }
    }
}
