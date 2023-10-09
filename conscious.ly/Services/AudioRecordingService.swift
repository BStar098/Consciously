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
        let fileName = getDocumentsDirectory().appendingPathComponent("\(Date().description(with: .current)).m4a")
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
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
        if let recorder = audioRecorder, !recorder.isRecording {
            recorder.record()
        }
    }
    
    func stopRecording (){
        if let recorder = audioRecorder, recorder.isRecording {
            recorder.stop()
            audioRecorder = nil
        }
    }
    
}
