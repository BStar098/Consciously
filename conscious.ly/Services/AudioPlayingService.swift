//
//  AudioPlayingService.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 08/12/2023.
//

import Foundation
import AVFoundation
import FirebaseStorage


class AudioPlayingService {
    var player : AVPlayer?
    var isPlaying : Bool = false
    
    
    func play(file:StorageReference) async throws {
        do {
           let urlInstance =  try await file.downloadURL()
            print(urlInstance)
            self.player = .init(url:urlInstance)
            if let safePlayer = self.player {
                safePlayer.play()
                self.isPlaying.toggle()
            }
        } catch  {
            print(error.localizedDescription)
        }
        
           
    }
    
    func pause() {
        if let safePlayer = self.player {
            safePlayer.pause()
            self.isPlaying.toggle()
        }
    }
    
}
