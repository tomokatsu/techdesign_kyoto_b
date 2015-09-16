import RealmSwift

class Playlist: Object {
    dynamic var title = ""
    dynamic var playlister = ""
    dynamic var comment = ""
    dynamic var isInspire = false
    dynamic var inspiredNumber = 0
    dynamic var userImageURL = ""
    dynamic var mood = ""
    dynamic var playlisterImage = ""
    var musicTracks = List<MusicTrack>()
    var additionalTracks = List<MusicTrack>()
}
