import RealmSwift

class Playlist: Object {
    dynamic var title = ""
    dynamic var playlister = ""
    dynamic var comment = ""
            var musisTracks = List<MusicTrack>()
}
