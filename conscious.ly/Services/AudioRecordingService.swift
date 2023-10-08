//
//  AudioRecorder.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 08/10/2023.
//

import AVFoundation


class AudioRecordingService {
    var audioRecorder: AVAudioRecorder?
    
    init () {
        setUpRecorder()
    }
    
    
    private func setUpRecorder (){
        let fileName = getDocumentsDirectory().appendingPathComponent(Date().formatted())
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            audioRecorder = try AVAudioRecorder(url:fileName, settings:settings)
            audioRecorder?.prepareToRecord()
        } catch {
            print(error.localizedDescription)
        }
       
    }
    
    func startRecording (){
        if audioRecorder?.isRecording != nil && audioRecorder?.isRecording != true {
            audioRecorder?.record()
        }
    }
    
    func stopRecording (){
        if audioRecorder?.isRecording != nil && audioRecorder?.isRecording == true {
            audioRecorder?.stop()
        }
    }
    
}
