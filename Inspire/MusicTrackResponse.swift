import ObjectMapper

class MusicTrackResponse: Mappable {
    var musics: [MusicTrack] = []

    static func newInstance(map: Map) -> Mappable? {
        return MusicTrackResponse()
    }

    func mapping(map: Map) {
        musics <- map["result"]
    }
}


class MusicTrack: Mappable {
    var name = ""
    var artistName = ""
    var previewUrl = ""

    static func newInstance(map: Map) -> Mappable? {
        return MusicTrack()
    }

    func mapping(map: Map) {
        name <- map["trackName"]
        artistName <- map["artistName"]
        previewUrl <- map["previewUrl"]
    }
}