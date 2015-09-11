import Foundation
import AVFoundation

class PlayerManager {
    static let sharedInstance = PlayerManager()

    var playlist: Playlist?
    var isPlaying: Bool
    var currentPlayngTrack: MusicTrack?
    var audioPlayer: AVPlayer?
    var toPlayIndex: Int

    private init() {
        isPlaying = false
        toPlayIndex = 0
    }

    func play() {
        isPlaying = true
        let url = NSURL(string: currentPlayngTrack!.previewUrl)!
        audioPlayer = AVPlayer(URL: url)
        audioPlayer?.play()
    }

    func stop() {
        isPlaying = false
        audioPlayer?.pause()
    }

    func next() {
        toPlayIndex++
    }

    func back() {
        toPlayIndex--
        if toPlayIndex < 0 {
            //TODO: get last index
        }
    }

    func restart() {
        play()
    }
}
