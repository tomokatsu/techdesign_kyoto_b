import ObjectMapper

class MusicTrackResponse: Mappable {
    var musics: [OMMusicTrack] = []

    static func newInstance(map: Map) -> Mappable? {
        return MusicTrackResponse()
    }

    func mapping(map: Map) {
        musics <- map["result"]
    }
}


class OMMusicTrack: Mappable {
    var name = ""
    var artistName = ""
    var previewUrl = ""

    static func newInstance(map: Map) -> Mappable? {
        return OMMusicTrack()
    }

    func mapping(map: Map) {
        name <- map["trackName"]
        artistName <- map["artistName"]
        previewUrl <- map["previewUrl"]
    }
}