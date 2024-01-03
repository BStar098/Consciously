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
    @Published var alertMessage : String = "";
    @Published var showAlert: Bool = false;
    
    init (){
        let user = Auth.auth().currentUser
        self.userSession = user
        
        
        
    }
    
    func logIn (email:String, password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            self.alertMessage = "Logged in successfully"
        } catch {
            self.alertMessage = error.localizedDescription
        }
        self.showAlert = true
    }
    
    func signUp (email:String, password:String) async throws {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
            self.alertMessage = "Signed up successfully"
        } catch {
            self.alertMessage = error.localizedDescription
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
    
    func updateEmail (email: String) async throws {
        do {
            if let currentUser  = self.userSession {
                try await currentUser.updateEmail(to: email)
            }
        } catch {
            throw error
        }
    }
    
    func updateName (name: String) async throws {
        do {
            if let currentUser  = self.userSession {
                let changeRequest = currentUser.createProfileChangeRequest()
                changeRequest.displayName = name
                try await changeRequest.commitChanges()
                try await self.reloadUser()
            }
        } catch {
            throw error
        }
    }
    
    func updatePassword (password: String) async throws {
        do {
            if let currentUser  = self.userSession {
                try await currentUser.updatePassword(to: password)
            }
        } catch {
            throw error
        }
    }
    
    func update (name: String, email: String, password: String) async throws {
        do {
            if self.userSession != nil {
                if email != "" {
                    try await self.updateEmail(email:email)
                }
                if name != ""  {
                    try await self.updateName(name:name)
                }
                if password != "" {
                    try await self.updatePassword(password: password)
                }
                
                    try await self.reloadUser()
                
            }
            
        } catch {
            self.alertMessage = error.localizedDescription
            self.showAlert.toggle()    
        }
    }
    
    func reloadUser() async throws {
        if let currentUser = self.userSession {
            try await currentUser.reload()
            if let user = Auth.auth().currentUser {
                self.userSession = user
            }
            
        }
       
    }
    
}
