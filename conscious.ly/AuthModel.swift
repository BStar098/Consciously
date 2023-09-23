//
//  AuthModel.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 23/09/2023.
//

import Foundation
import SwiftData
import Firebase

@Model
final class AuthModel {
    private var authenticated : Bool;
    
    init (authenticated: Bool){
        self.authenticated = authenticated
    }
    
    func logIn (email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            
        }
    }
    
    func signUp (email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            
            
        }
    }
    
}
