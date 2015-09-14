import Foundation

class Seeds {
    func addDemoData(){
        if !NSUserDefaults.standardUserDefaults().boolForKey("IsSeedAdded") {

            var recommendPlaylists: [Playlist] = []

            /*APIClient.sharedInstance.GET(["term":"exile", "country":"JP", "entity":"musicTrack"]) { (response: MusicTrackResponse?, error: NSError?) in

            var playlist: Playlist = Playlist()
            for i in 0...7{
            playlist.musicTracks.append(response!.mappingToRealmObject()[i])
            }
            playlist.title = "EXILE有名曲まとめ"
            playlist.comment = "EXILEの有名な曲をまとめてみました！"
            playlist.playlister = "HIRO"
            playlist.inspiredNumber = 174
            recommendPlaylists.append(playlist)

            }*/

            var playlist: Playlist = Playlist()
            playlist.title = "AKB48有名曲まとめ"
            playlist.comment = "AKB48の有名な曲をまとめてみました！"
            playlist.playlister = "YASUSHI"
            playlist.inspiredNumber = 57
            playlist.musicTracks.append(
                createMusicTrack(
                    "ハロウィン・ナイト",
                    artist: "AKB48",
                    previewUrl: "http://a594.phobos.apple.com/us/r30/Music6/v4/55/be/cd/55becdb8-8426-f301-4d45-71843320368e/mzaf_8702226010469567801.plus.aac.p.m4a",
                    artworkUrl: "http://is1.mzstatic.com/image/thumb/Music1/v4/40/bc/27/40bc27a5-64ea-448a-bbd5-efd274d8cd53/KIZM-393-1400.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "恋するフォーチュンクッキー",
                    artist: "AKB48",
                    previewUrl: "http://a624.phobos.apple.com/us/r20/Music/v4/92/bb/8f/92bb8fcd-d8db-fd68-7b81-a542bc2a70ed/mzaf_391836415160581738.plus.aac.p.m4a",
                    artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/a6/4c/d5/a64cd540-bc15-37c2-74ed-ed51a0b013e4/32nd_Type-A.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "ヘビーローテーション",
                    artist: "AKB48",
                    previewUrl: "http://a998.phobos.apple.com/us/r20/Music2/v4/83/50/1f/83501f1c-d92b-63fb-fa77-11c7cb9d1028/mzaf_1582262840040872210.aac.m4a",
                    artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/84/15/32/mzi.eenpnigo.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "フライングゲット",
                    artist: "AKB48",
                    previewUrl: "http://a872.phobos.apple.com/us/r20/Music2/v4/42/0d/cb/420dcba8-1d6e-7884-b9be-09fcc5558467/mzaf_5618895492947598200.aac.m4a",
                    artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/45/6c/e8/mzi.yurbzdru.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "Everyday、カチューシャ",
                    artist: "AKB48",
                    previewUrl: "http://a1580.phobos.apple.com/us/r20/Music/v4/bd/94/7d/bd947d62-6891-80db-c52b-1406a2e2e7cc/mzaf_3796936062084215286.aac.m4a",
                    artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/d6/7f/97/mzi.ntmvljrh.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "ポニーテールとシュシュ",
                    artist: "AKB48",
                    previewUrl: "http://a1054.phobos.apple.com/us/r20/Music2/v4/8f/87/0f/8f870fd6-03a9-2eda-64c8-9c11becc7966/mzaf_4553962118531681933.aac.m4a",
                    artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/24/29/c5/mzi.qpahdoza.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "真夏のSounds good !",
                    artist: "AKB48",
                    previewUrl: "http://a1490.phobos.apple.com/us/r20/Music/78/b7/9a/mzi.ttpfnoos.aac.p.m4a",
                    artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/99/0f/99/990f9977-cc4f-216c-9f1f-4736a41a5d25/KIZM-151-600.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "Beginner",
                    artist: "AKB48",
                    previewUrl: "http://a455.phobos.apple.com/us/r20/Music/v4/5c/d1/c4/5cd1c402-8d23-7ca0-ddb7-830033650eb7/mzaf_557086412903685094.aac.m4a",
                    artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/9a/e6/aa/mzi.cstpiuqw.jpg/100x100bb-85.jpg"
                ))
            recommendPlaylists.append(playlist)

            playlist = Playlist()
            playlist.title = "EXILE有名曲まとめ"
            playlist.comment = "EXILEの有名な曲をまとめてみました！"
            playlist.playlister = "HIRO"
            playlist.inspiredNumber = 174
            playlist.musicTracks.append(
                createMusicTrack(
                    "Rising Sun",
                    artist: "EXILE",
                    previewUrl: "http://a1258.phobos.apple.com/us/r20/Music/v4/38/2c/1b/382c1bd3-18cc-88ad-9d43-5c87a1f1ac6a/mzaf_689946147304499788.aac.m4a",
                    artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/v4/7d/71/66/7d716672-11e4-369d-fa6a-f3f3658f1fd7/RZCD-59275.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "Lovers Again",
                    artist: "EXILE",
                    previewUrl: "http://a1837.phobos.apple.com/us/r20/Music/v4/ef/93/d5/ef93d592-b6b8-5bcd-9776-294acab2f271/mzaf_6294600659490670183.aac.m4a",
                    artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/50/6f/7e/mzi.fsjbavke.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "24karats GOLD SOUL",
                    artist: "EXILE",
                    previewUrl: "http://a1253.phobos.apple.com/us/r20/Music4/v4/c4/9a/48/c49a48d1-5607-76a3-1db6-e2ca09c09356/mzaf_7994261838214960180.plus.aac.p.m4a",
                    artworkUrl: "http://is4.mzstatic.com/image/thumb/Music69/v4/c6/7e/59/c67e59eb-5160-0418-0adc-44f9f484ba74/ANTCD-15708.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "道",
                    artist: "EXILE",
                    previewUrl: "http://a1680.phobos.apple.com/us/r20/Music/v4/63/40/9c/63409ca3-8b4f-f691-a16c-adce677b9d94/mzaf_1983412360699568110.aac.m4a",
                    artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/7b/f4/60/mzi.bbsvotlb.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "Choo Choo TRAIN",
                    artist: "EXILE",
                    previewUrl: "http://a207.phobos.apple.com/us/r20/Music2/v4/ec/60/e4/ec60e4af-9635-0ccc-59f7-34b1c3c5bf93/mzaf_3907709362736336517.aac.m4a",
                    artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/da/b7/57/mzi.fdgrhxoz.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "ただ…逢いたくて",
                    artist: "EXILE",
                    previewUrl: "http://a201.phobos.apple.com/us/r20/Music/v4/02/84/bb/0284bba5-00eb-b75b-d6d4-dfac43ebb662/mzaf_8528920062462453633.aac.m4a",
                    artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/a8/7a/3a/mzi.lknxequn.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "ふたつの唇",
                    artist: "EXILE",
                    previewUrl: "http://a1562.phobos.apple.com/us/r20/Music/v4/3e/75/19/3e7519ca-3679-c41d-3239-367a88fd65d1/mzaf_6406315736634827578.aac.m4a",
                    artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/01/04/f2/mzi.urlcffdh.jpg/100x100bb-85.jpg"
                ))
            playlist.musicTracks.append(
                createMusicTrack(
                    "I Wish For You",
                    artist: "EXILE",
                    previewUrl: "http://a1843.phobos.apple.com/us/r20/Music2/v4/be/df/cd/bedfcdd9-eb25-a5fd-1856-9734defc14bc/mzaf_530961967493900486.aac.m4a",
                    artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/ab/0e/8d/mzi.mjlbkxhc.jpg/100x100bb-85.jpg"
                ))
            recommendPlaylists.append(playlist)

            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "IsSeedAdded")

            playlist.musicTracks.append(
                createMusicTrack(
                    "",
                    artist: "",
                    previewUrl: "",
                    artworkUrl: ""
                ))
        }
    }

    func createMusicTrack(title: String, artist: String, previewUrl: String, artworkUrl: String) -> MusicTrack{
        var musicTrack: MusicTrack = MusicTrack()
        musicTrack.title = title
        musicTrack.artist = artist
        musicTrack.previewUrl = previewUrl
        musicTrack.artworkUrl = artworkUrl
        
        return musicTrack
    }
}