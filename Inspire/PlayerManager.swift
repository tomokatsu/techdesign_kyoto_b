import Foundation
import AVFoundation

class PlayerManager{
    static let sharedInstance = PlayerManager()

    var playlist: Playlist?
    var players: [Player?]
    var toPlayIndex: Int

    private init() {
        toPlayIndex = 0
        playlist = nil
        players = []
    }

    func setPlaylist(playlist: Playlist) {
        self.playlist = playlist
        self.players = [Player?](count: playlist.musicTracks.count, repeatedValue: nil)
    }

    func playNextSong() {
        pause()
        selectNextSong()
        reset()
        play()
    }

    func playPrevSong() {
        pause()
        selectPrevSong()
        reset()
        play()
    }

    func reset() {
        player().reset()
    }

    func pause() {
        player().pause()
    }

    func play() {
        player().play()
    }

    func isPlaying()->Bool {
        return player().isPlaying
    }

    func title() -> String {
        return player().title()
    }

    func artist() -> String {
        return player().artist()
    }

    func artworkUrl() -> NSURL {
        return player().artworkUrl()
    }

    func playTime() -> String {
        return player().playTime()
    }

    func playingTime() -> String {
        return player().playingTime()
    }

    func getProgress() -> Float{
        return player().getProgress()
    }

    func setProgress(value: Float){
        player().setProgress(value)
    }

    private func selectNextSong() {
        if(toPlayIndex < (playlist!.musicTracks.count - 1)) {
            toPlayIndex += 1
        } else {
            toPlayIndex = 0
        }
    }

    private func selectPrevSong()  {
        if (toPlayIndex > 0) {
            toPlayIndex -= 1
        } else {
            toPlayIndex = playlist!.musicTracks.count - 1
        }
    }

    private func player() -> Player {
        if let player = self.players[toPlayIndex] {
            return player
        } else {
            let track = playlist?.musicTracks[toPlayIndex]
            self.players[toPlayIndex] = Player(mTrack: track!)
            return players[toPlayIndex]!
        }
    }
}

class Player: NSObject {
    var player: AVPlayer!
    var mTrack: MusicTrack
    let zeroSec: CMTime = CMTimeMake(0, 1)
    var asset: AVURLAsset?
    var isPlaying: Bool

    init(mTrack: MusicTrack) {
        self.mTrack = mTrack
        self.isPlaying = false
        super.init()
        self.createAVPlayer()
    }

    func play() {
        player.play()
        isPlaying = true
    }

    func pause() {
        player.pause()
        isPlaying = false
    }

    func reset() {
        player.seekToTime(zeroSec)
        isPlaying = false
    }

    func title() -> String {
        return mTrack.title
    }

    func artist() -> String {
        return mTrack.artist
    }

    func artworkUrl() -> NSURL {
        return NSURL(string: mTrack.artworkUrl)!
    }

    func playTime() -> String {
        let durationTime = CMTimeGetSeconds(self.asset!.duration)
        return self.formatTime(durationTime)
    }

    func playingTime() -> String {
        let currentTime = CMTimeGetSeconds(player.currentTime())
        return self.formatTime(currentTime)
    }

    private func formatTime(mSecTime: Double) -> String {
        let h = Int(mSecTime / 3600)
        let m = Int(mSecTime - Double(h) * 3600) / 60
        let s = Int(mSecTime - 3600 * Double(h)) - m * 60

        return String(format: "%02d:%02d", m, s)
    }

    func getProgress() -> Float {
        let durationTime: Float = Float(CMTimeGetSeconds(self.asset!.duration))
        var currentTime: Float = Float(CMTimeGetSeconds(player.currentTime()))

        if currentTime == 0.0 {
            currentTime = 0.000001  // avoid infinite
        }

        return (currentTime / durationTime)
    }

    func setProgress(value: Float){
        let durationTime: Float = Float(CMTimeGetSeconds(self.asset!.duration))
        var cmtime = CMTimeMakeWithSeconds(Float64(value * durationTime), 1)
        player.seekToTime(cmtime)
    }

    private func createAVPlayer() {
        let url = NSURL(string: mTrack.previewUrl)!
        self.asset = AVURLAsset(URL: url, options: [:])
        var playerItem = AVPlayerItem(asset: self.asset)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("playerDidFinishPlaying:"), name: AVPlayerItemDidPlayToEndTimeNotification, object: playerItem)

        if let p = AVPlayer(playerItem: playerItem) {
            self.player = p
        } else {
            println("failed generating player")
        }
    }

    func playerDidFinishPlaying(note: NSNotification) {
        self.reset()
        PlayerManager.sharedInstance.playNextSong()
    }
}