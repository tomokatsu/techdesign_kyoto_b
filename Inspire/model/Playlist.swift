import RealmSwift

class Playlist: Object {
    dynamic var title = ""
    dynamic var playlister = ""
            let musisTracks = List<MusicTrack>()
}
