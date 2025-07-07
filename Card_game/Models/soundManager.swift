// SoundManager.swift

import Foundation
import AVFoundation

class SoundManager {
    static var player: AVAudioPlayer?
    static var loopedPlayer: AVAudioPlayer?

    static func play(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    static func playLooped(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }

        do {
            loopedPlayer = try AVAudioPlayer(contentsOf: url)
            loopedPlayer?.volume = 0.3
            loopedPlayer?.numberOfLoops = -1  // Infinite loop
            loopedPlayer?.play()
        } catch {
            print("Error playing looped sound: \(error.localizedDescription)")
        }
    }

    static func stopLooped() {
        loopedPlayer?.stop()
    }
}

