//
//  AddressTableViewCell.swift
//  AapUK
//
//  Created by Mangesh Karekar on 30/10/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import UIKit

enum KeyboardType{
    case numeric
    case alphabetic
}

protocol AddressTableViewCellActions: class {
    
    func addressTableViewCell(didPressDoneWithLabel Label:String?, text:String?)
    func addressTableViewCell(didPressNextWithLabel Label:String?, text:String?)
    
}

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var keyboardType: KeyboardType?{
        didSet{
            if let keyboardType = keyboardType{
                setKeyboardType(forType: keyboardType)
            }
        }
    }
    
    weak var delegate: AddressTableViewCellActions?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        let nextButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(nextTapped))
        toolBar.items = [doneButton,nextButton]
        textField.inputAccessoryView = toolBar
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func doneTapped(){
        textField.resignFirstResponder()
        delegate?.addressTableViewCell(didPressDoneWithLabel: label.text, text: textField.text)
    }
    
    @objc func nextTapped(){
        textField.resignFirstResponder()
        delegate?.addressTableViewCell(didPressNextWithLabel: label.text, text: textField.text)
    }
    
    func setKeyboardType(forType type: KeyboardType){
        switch type {
        case .numeric:
            textField.keyboardType = UIKeyboardType.namePhonePad
        default:
            textField.keyboardType = UIKeyboardType.alphabet
        }
    }

}
