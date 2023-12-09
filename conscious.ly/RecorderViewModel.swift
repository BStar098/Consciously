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
    var audioRecorder : AudioRecordingService  = AudioRecordingService()

    
    var isRecording: Bool {
        if let finalAudioRecorder = audioRecorder.audioRecorder {
            return finalAudioRecorder.isRecording
        } else {
            return false
        }
    }
    
    func startRecording(timeOfDay: TimeOfDay) {
        self.audioRecorder.startRecordingAudio(timeOfDay: timeOfDay)
    }
    
    func stopRecording (timeOfDay: TimeOfDay) {
        self.audioRecorder.stopRecordingAndUploadAudio(timeOfDay:timeOfDay )
    }
    
}
