import Foundation
import AVFoundation
import FirebaseStorage

class AudioPlayingService : ObservableObject {
    var player: AVPlayer?
    @Published var isPlaying: Bool = false

    func play(file: StorageReference) async throws {
        do {
            let urlInstance: URL = try await file.downloadURL()
            let playerItem = AVPlayerItem(url: urlInstance)
            self.player = AVPlayer(playerItem: playerItem)

            NotificationCenter.default.addObserver(
                self,
                selector: #selector(playerDidFinishPlaying(_:)),
                name: .AVPlayerItemDidPlayToEndTime,
                object: playerItem
            )
            
            if let safePlayer = self.player {
                safePlayer.play()
                self.isPlaying.toggle()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func pause() {
        if let safePlayer = self.player {
            NotificationCenter.default.removeObserver(self)
            safePlayer.pause()
            safePlayer.replaceCurrentItem(with: nil)
            self.isPlaying = false
        }
    }
    
    @objc func playerDidFinishPlaying(_ notification: Notification) {
        self.pause()
        if let playerItem = notification.object as? AVPlayerItem {
            print("Playback finished for \(String(describing: playerItem.asset))")
        }
    }
    
}

    
    
    
    
    
    
    

