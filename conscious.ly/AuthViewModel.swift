//
//  AuthModel.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 23/09/2023.
//


import SwiftData
import Firebase
import SwiftUI


final class AuthViewModel {
    private var authenticated : Bool = false
    
    func logIn (email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if error != nil {
                print(error as Any)
            } else {
                print(authResult as Any)
                self.authenticated = true
            }
        }
    }
    
    func signUp (email:String, password:String){
        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
            if error != nil {
                print(error as Any)
            } else {
                print(authResult as Any)
            }
            
        }
    }
    
}
