//
//  File.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 08/10/2023.
//

import Foundation
import SwiftUI
import AVFoundation

final class RecorderViewModel : ObservableObject {
    var audioRecorder : AVAudioRecorder?
    
    var isRecording: Bool {
            audioRecorder?.isRecording ?? false
        }
    
    init () {
        self.audioRecorder = AudioRecordingService().audioRecorder
    }
    
    func startRecording() {
        audioRecorder?.record()
    }
    
    func stopRecording () {
        audioRecorder?.stop()
    }
    
}
