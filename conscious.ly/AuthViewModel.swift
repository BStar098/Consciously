//
//  AuthModel.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 23/09/2023.
//


import SwiftData
import Firebase
import SwiftUI


final class AuthViewModel: ObservableObject {
    @Published var authenticated : Bool = false
    @Published var loginErrorMessage : String? = "";
    @Published var signUpErrorMessage : String? = "";
    @Published var showAlert: Bool = false;

    
    
    func logIn (email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if error != nil {
                if let error = error {
                    self.loginErrorMessage = error.localizedDescription
                    self.showAlert = true
                }
            } else {
                self.loginErrorMessage = nil
                self.authenticated = true
            }
        }
    }
    
    func signUp (email:String, password:String){
        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
            if error != nil {
                if let error = error {
                    self.signUpErrorMessage = error.localizedDescription
                    self.showAlert = true
                }
            } else {
                self.signUpErrorMessage = nil
            }
            
        }
    }
    
}
