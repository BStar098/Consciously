//
//  AuthModel.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 23/09/2023.
//


import SwiftData
import Firebase
import SwiftUI

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    @Published var loginMessage : String = "";
    @Published var signUpMessage : String = "";
    @Published var showAlert: Bool = false;

    init (){
        self.userSession = Auth.auth().currentUser
    }
    
    func logIn (email:String, password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            self.loginMessage = error.localizedDescription
            self.showAlert = true
        }
    }
    
    func signUp (email:String, password:String) async throws {
            do {
                try await Auth.auth().createUser(withEmail: email, password: password)
                self.signUpMessage = "Signed up successfully"
            } catch {
                self.signUpMessage = error.localizedDescription
            }
            self.showAlert = true
    }
    
    func logOut () async throws {
            do {
                try Auth.auth().signOut()
                self.userSession = nil
            } catch {
                throw error
            }
    }
    
    
}
