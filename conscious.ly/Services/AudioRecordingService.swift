//
//  AudioRecorder.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 08/10/2023.
//

import AVFoundation
import FirebaseStorage
import FirebaseAuth


class AudioRecordingService {
    var currentUser : FirebaseAuth.User? = Auth.auth().currentUser
    var audioRecorder: AVAudioRecorder?
    let storage = Storage.storage()
    var cloudStorageRef : StorageReference;
    var audioNote : AudioNote?
    let recorderSettings : [String: Any] = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 44100.0,
        AVNumberOfChannelsKey: 2,
        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
    ]
    
    init () {
        self.cloudStorageRef = storage.reference()
        if let user = currentUser {
            self.cloudStorageRef = storage.reference().child("audios/\(user.uid)/\(getCurrentISO8601Date())")
        }
    }
    
    func startRecordingAudio (timeOfDay:TimeOfDay){
        //Initial configurations, settings and filename.
        self.audioNote = AudioNote(date:getCurrentISO8601Date(), time:timeOfDay)
        //Creating an instance of AVAudioRecorder with chosen filename
        if let audio = self.audioNote {
            do {
                self.audioRecorder = try AVAudioRecorder(url: audio.fileURL, settings:self.recorderSettings)
            } catch {
                print(error.localizedDescription)
            }
            //Recording
            if let recorder = self.audioRecorder, !recorder.isRecording {
                recorder.prepareToRecord()
                recorder.record()
            }
        }
    }
    
    func stopRecordingAndUploadAudio (timeOfDay: TimeOfDay){
        if let recorder = audioRecorder, recorder.isRecording {
            let localeFileUrlPath = recorder.url
            let cloudStoragePath = cloudStorageRef.child("\(timeOfDay.rawValue).m4a")
            recorder.stop()
            let uploadTask = cloudStoragePath.putFile(from: localeFileUrlPath, metadata: nil){ metadata, error in
                guard let metadata = metadata else {
                    //error management
                    return
                }
            }
            audioRecorder = nil
        }
    }
}
