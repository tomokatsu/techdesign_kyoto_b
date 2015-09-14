import RealmSwift

class Playlist: Object {
    dynamic var title = ""
    dynamic var playlister = ""
    dynamic var comment = ""
    dynamic var isInspire = false
    dynamic var inspiredNumber = 0
    dynamic var userImageURL = ""
    var musicTracks = List<MusicTrack>()
    var additionalTracks = List<MusicTrack>()
}
