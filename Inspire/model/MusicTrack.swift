import RealmSwift

class MusicTrack: Object {
    dynamic var trackId = 0
    dynamic var title = ""
    dynamic var artist = ""
    dynamic var previewUrl = ""
    dynamic var artworkUrl = ""

    override static func indexedProperties() -> [String] {
        return ["trackId"]
    }

}
