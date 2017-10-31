//
//  Volounteer.swift
//  AapUK
//
//  Created by Mangesh Karekar on 31/10/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import Foundation

public enum PassportType: String{
    case indian = "Indian"
    case nonIndian = "Non Indian"
}

struct Volounteer {
    
    var name = ""
    var passport = ""
    var contribution = [String]()
    
    
}
