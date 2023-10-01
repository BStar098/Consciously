//
//  User.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 24/09/2023.
//

import Foundation

struct User : Identifiable, Codable {
    let id : String;
    let fullname : String;
    let email : String;
    
    init(id: String, fullname: String, email: String) {
        self.id = id
        self.fullname = fullname
        self.email = email
    }
    
}
