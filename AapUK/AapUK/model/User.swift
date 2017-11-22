//
//  User.swift
//  AapUK
//
//  Created by Mangesh Karekar on 21/11/2017.
//  Copyright © 2017 Mangesh. All rights reserved.
//

import Foundation

public enum PassportType: String{
    case indian = "Indian"
    case nonIndian = "Non Indian"
}

public enum UserType: String{
    case supporter = "supporter"
    case volunteer = "volunteer"
}


struct User{
    var name: String?
    var address: String?
    var email: String?
    var phone: String?
    var userType: String?
    var passport: String?
    var contribution = Set<String>()
}
