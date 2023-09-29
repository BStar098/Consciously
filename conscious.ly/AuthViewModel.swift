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
    @Published var loginMessage : String = "";
    @Published var signUpMessage : String = "";
    @Published var showAlert: Bool = false;

    
    
    func logIn (email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if error != nil {
                if let error = error {
                    self.loginMessage = error.localizedDescription
                }
            } else {
                self.loginMessage = "Logged in successfully"
                self.authenticated = true
            }
            self.showAlert = true

        }
    }
    
    func signUp (email:String, password:String){
        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
            if error != nil {
                if let error = error {
                    self.signUpMessage = error.localizedDescription
                }
            } else {
                self.signUpMessage = "Signed up successfully"

            }
            self.showAlert = true

            
        }
    }
    
}
