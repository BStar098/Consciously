//
//  User.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 24/09/2023.
//

import Foundation
import SwiftData

@Model
class User {
    let id : String;
    let fullname : String;
    let email : String;
    
    init(id: String, fullname: String, email: String) {
        self.id = id
        self.fullname = fullname
        self.email = email
    }
    
}
