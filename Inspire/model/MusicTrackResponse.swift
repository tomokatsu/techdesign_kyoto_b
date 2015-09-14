import ObjectMapper

class MusicTrackResponse: Mappable {
    var musics: [OMMusicTrack] = []

    static func newInstance(map: Map) -> Mappable? {
        return MusicTrackResponse()
    }

    func mapping(map: Map) {
        musics <- map["results"]
    }

    func mappingToRealmObject() -> [MusicTrack] {
        var realmMusicTracks: [MusicTrack] = []
        for music in musics {
            realmMusicTracks.append(music.mappingToRealmObject())
        }
        return realmMusicTracks
    }

}


class OMMusicTrack: Mappable {
    var name = ""
    var artistName = ""
    var previewUrl = ""
    var artworkUrl = ""

    static func newInstance(map: Map) -> Mappable? {
        return OMMusicTrack()
    }

    func mapping(map: Map) {
        name <- map["trackName"]
        artistName <- map["artistName"]
        previewUrl <- map["previewUrl"]
        artworkUrl <- map["artworkUrl100"]
    }

    func mappingToRealmObject() -> MusicTrack {
        let music = MusicTrack()
        music.title = name
        music.artist = artistName
        music.previewUrl = previewUrl
        music.artworkUrl = artworkUrl
        return music
    }

}