
class PlayerManager {
    static let sharedInstance = PlayerManager()

    var playlist: Playlist?
    var isPlaying: Bool
    var currentPlayngTrack: MusicTrack?

    private init() {
        isPlaying = false
    }

    func play() {
        isPlaying = true
    }

    func stop() {
        isPlaying = false
    }

    func next() {

    }

    func back() {

    }

    func restart() {

    }
}
