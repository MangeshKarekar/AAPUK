//
//  DetailsTableViewCell.swift
//  AapUK
//
//  Created by Mangesh Karekar on 22/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

protocol DetailTableViewCellActions: class {
    
    func detailsCell(didPressDoneWithName name:String?, address:String?, email:String?, phone: String?)
    
}

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!

    weak var delegate: DetailTableViewCellActions?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        
        toolBar.items = [doneButton]
        
        name.inputAccessoryView = toolBar
        address.inputAccessoryView = toolBar
        phone.inputAccessoryView = toolBar
        email.inputAccessoryView = toolBar

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func doneTapped(){
        name.resignFirstResponder()
        address.resignFirstResponder()
        phone.resignFirstResponder()
        email.resignFirstResponder()
        delegate?.detailsCell(didPressDoneWithName: name.text, address: address.text, email: email.text, phone: phone.text)
    }
}
