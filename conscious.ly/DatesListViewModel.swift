//
//  DatesListViewModel.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 28/10/2023.
//

import Foundation
import FirebaseStorage
import SwiftUI
import FirebaseAuth

class DatesListViewModel : ObservableObject {
    private var currentUser : FirebaseAuth.User? = Auth.auth().currentUser
    @Published var datesList : [StorageReference] = []
    @Published var audiosList : [StorageReference] = []
    private var storageRef : StorageReference = Storage.storage().reference().child("audios")
    
    init() {
        if let user = self.currentUser {
            self.storageRef = self.storageRef.child("\(user.uid)/")
        }
    }
    
    func getRecordingsFolders(){
        self.storageRef.listAll {(result, error) in
            if let error = error {
                print(error)
            }
            if let result = result {
                self.datesList = result.prefixes
            }
            
        }
    }
    
    func getAudios(date: String){
        self.storageRef.child(date).listAll {(result, error) in
            if let error = error {
                print(error)
            }
            if let result = result {
                self.audiosList = result.items
            }
            
        }
    }
}
