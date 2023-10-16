//
//  Audio.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 15/10/2023.
//

import Foundation
import SwiftData
import FirebaseAuth

class AudioNote {
    let userId : String;
    let fileURL : URL;
    
    init(date: String, time: TimeOfDay) {
        if let user = Auth.auth().currentUser {
            self.userId = user.uid
            self.fileURL = getDocumentsDirectory().appendingPathComponent("\(date)-\(time.rawValue).m4a")
        } else {
            self.userId = ""
            self.fileURL = getDocumentsDirectory()
        }
    }
    
}
