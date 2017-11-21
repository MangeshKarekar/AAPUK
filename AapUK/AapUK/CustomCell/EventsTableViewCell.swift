//
//  EventsTableViewCell.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit
import Firebase


class EventsTableViewCell: UITableViewCell {

    @IBOutlet var eventsImageView: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var contactInfo: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var details: UILabel!

    
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

    func setEvent(forDocument document:DocumentSnapshot){
        let data = document.data()
        title.text = data["title"] as? String
        contactInfo.text = data["contact info"] as? String
        location.text = data["location"] as? String
        time.text = data["time"] as? String
        details.text = data["details"] as? String
        DispatchQueue.global().async {[weak self] in
            self?.setImage(forBase64: data["imageSource"] as? String)
        }
    }
    
    func setImage(forBase64 string: String?){
        if let string = string,
            let data = Data(base64Encoded: string, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
        {
            DispatchQueue.main.async {[weak self] in
                self?.eventsImageView.image = UIImage(data: data)
            }
        }
    }
}
