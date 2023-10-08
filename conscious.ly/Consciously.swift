//
//  conscious_lyApp.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/09/2023.
//

import SwiftUI
import SwiftData
import FirebaseCore
import AVFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      do {
          let session = AVAudioSession.sharedInstance()
          try session.setCategory(.record, mode: .default, options:[])
          try session.setActive(true)
      } catch{
          print(error.localizedDescription)
      }
    return true
  }
}

@main
struct Consciously: App {
    @StateObject var viewModel = AuthViewModel()
    
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
