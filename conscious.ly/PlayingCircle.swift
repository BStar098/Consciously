//
//  PlayingCircle.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 26/12/2023.
//

import SwiftUI
import FirebaseStorage

struct PlayingCircle: View {
    @StateObject var player = AudioPlayingService()
    var file : StorageReference
    var day : String
    var backGroundStyle : Color {
        self.player.isPlaying ? .red : .white

    }
    var textColor  : Color {
        self.player.isPlaying ? .white : .black
    }
    func handlePlay () async throws {
        do {
            if self.player.isPlaying {
                self.player.pause()
            } else {
                try await self.player.play(file: self.file)
            }


        } catch {
            print(error.localizedDescription)
        }
        
    }
    var circleText : String {
        self.player.isPlaying ? "PLAYING" : self.day
    }
    var body: some View {
        ZStack {
            Circle()
                .padding()
                .foregroundStyle(backGroundStyle)
            Text(circleText)
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundStyle(textColor)
        }.onTapGesture {
            Task {
                try await self.handlePlay()
            }
        }
    }
}


