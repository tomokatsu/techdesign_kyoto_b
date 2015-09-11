
class PlayerManager {
    static let sharedInstance = PlayerManager()

    var playlist: Playlist?
    var isPlaying: Bool
    var currentPlayngTrack: MusicTrack?
    var playngIndex: Int?

    private init() {
        isPlaying = false
    }
}
