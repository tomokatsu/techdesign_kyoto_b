import Foundation
import RealmSwift

class Seeds {
    init(){
        if !NSUserDefaults.standardUserDefaults().boolForKey("IsSeedAdded") {
            createRecommendPlaylists()
            createFavoriteMusicTracks()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "IsSeedAdded")
        }
    }

    func createFavoriteMusicTracks(){
        var musicTracks: [MusicTrack] = []

        musicTracks.append(
            createMusicTrack(
                "Dragon Night",
                artist: "SEKAI NO OWARI",
                previewUrl: "http://a407.phobos.apple.com/us/r20/Music3/v4/e6/2e/19/e62e1987-3add-ceed-37ba-beadc84aa16c/mzaf_8316994434485171788.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music3/v4/ff/39/b5/ff39b596-441c-fa6a-049b-951fa24c09d2/Dragon_Night_iT.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "ANTI-HERO",
                artist: "SEKAI NO OWARI",
                previewUrl: "http://a1844.phobos.apple.com/us/r20/Music5/v4/0e/09/4d/0e094dd0-7026-56e5-f153-e6130bad67eb/mzaf_5107267766003380287.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music7/v4/aa/39/f9/aa39f93c-e04c-d43a-8bc5-2e8fcb7f352b/TFCC-89564WW.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "RPG",
                artist: "SEKAI NO OWARI",
                previewUrl: "http://a359.phobos.apple.com/us/r20/Music5/v4/e2/f9/bb/e2f9bb18-bb42-5a44-23ab-1b5e920a9c67/mzaf_3872724280287880021.plus.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music5/v4/70/60/ab/7060abcc-5e52-1a97-4736-fa48c59dbaab/TFCC-89428.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "私以外私じゃないの",
                artist: "ゲスの極み乙女。",
                previewUrl: "http://a1521.phobos.apple.com/us/r1000/020/Music3/v4/74/fe/76/74fe76eb-23bc-a903-0b6f-7565697224b6/mzaf_5880383470871666845.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music3/v4/bd/00/a0/bd00a01a-9631-a60a-2cd2-81db0a49576f/825646114719.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "猟奇的なキスを私にして",
                artist: "ゲスの極み乙女。",
                previewUrl: "http://a1451.phobos.apple.com/us/r1000/002/Music/v4/e1/eb/f1/e1ebf1fc-fffc-04f6-6100-0c74572b1def/mzaf_5544171775392494515.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music6/v4/26/fe/f0/26fef093-6287-5ca0-82c5-47916049d69b/825646233649.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Break Free (feat. Zedd)",
                artist: "Ariana Grande",
                previewUrl: "http://a932.phobos.apple.com/us/r1000/007/Music4/v4/07/bf/61/07bf611d-98ee-e543-6471-d8297d323bff/mzaf_3525907358363476631.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/52/1b/90/521b904e-6fe1-e54d-97dc-b515983f4f21/UMG_cvrart_00602537939497_01_RGB72_1500x1500_14UMGIM28138.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "君に届け",
                artist: "flumpool",
                previewUrl: "http://a1477.phobos.apple.com/us/r30/Music/v4/25/47/48/25474867-2d34-8e37-f212-739cc285d4d1/mzaf_2677170788674384581.aac.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/v4/5e/c6/a8/5ec6a8b2-78b5-af62-3e9c-56542b266ffb/1M.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "花になれ",
                artist: "flumpool",
                previewUrl: "http://a607.phobos.apple.com/us/r30/Music/v4/4b/29/94/4b299434-c98c-b20c-620d-1218c5904184/mzaf_608953649448185311.aac.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/0f/1b/58/0f1b5882-27e1-1f75-a746-b348ccd5bd87/unrealJ.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "夏よ止めないで ~You're Romantic~",
                artist: "flumpool",
                previewUrl: "http://a651.phobos.apple.com/us/r30/Music5/v4/7f/02/9f/7f029f23-8d25-9d09-d8c7-74e639586033/mzaf_2984557020493265979.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music7/v4/72/5b/52/725b52f3-5016-11fc-778c-f123d40a926a/fp_natsu_yo_tomenaide_tsujyo_JK.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Someday",
                artist: "EXILE",
                previewUrl: "http://a490.phobos.apple.com/us/r20/Music/v4/4d/45/af/4d45af18-c3eb-6bc1-c3ee-003d66fe2f8a/mzaf_4560706282197704755.aac.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/v4/7d/71/66/7d716672-11e4-369d-fa6a-f3f3658f1fd7/RZCD-59275.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Ti Amo",
                artist: "EXILE",
                previewUrl: "http://a1821.phobos.apple.com/us/r20/Music/v4/8e/b5/4a/8eb54a13-4675-6d57-a456-83159d0757d4/mzaf_2537153531431199123.aac.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/6d/ee/d5/mzi.nkfrsdzs.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "ギンガムチェック",
                artist: "AKB48",
                previewUrl: "http://a1329.phobos.apple.com/us/r20/Music/33/44/a8/mzi.nrfacryh.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/v4/30/13/aa/3013aa8a-3de4-8ff7-a2e3-5f9a84551c98/Type-B_JK_KIZM169-70.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "大声ダイヤモンド",
                artist: "AKB48",
                previewUrl: "http://a1541.phobos.apple.com/us/r20/Music/v4/5b/6c/5a/5b6c5a28-fb61-feb7-8739-738e93b5b49f/mzaf_6751855159434674581.aac.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/c6/c2/ec/mzi.mlabexlx.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Love Me Harder",
                artist: "Ariana Grande & The Weeknd",
                previewUrl: "http://a1842.phobos.apple.com/us/r1000/024/Music5/v4/86/b6/77/86b67750-3463-1c89-af5f-c21ae2434ac4/mzaf_5531833939915077095.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/52/1b/90/521b904e-6fe1-e54d-97dc-b515983f4f21/UMG_cvrart_00602537939497_01_RGB72_1500x1500_14UMGIM28138.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "One Last Time",
                artist: "Ariana Grande",
                previewUrl: "http://a1769.phobos.apple.com/us/r1000/017/Music4/v4/3f/23/57/3f235795-e926-cd0c-365b-688154eb965f/mzaf_520111575490676065.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/52/1b/90/521b904e-6fe1-e54d-97dc-b515983f4f21/UMG_cvrart_00602537939497_01_RGB72_1500x1500_14UMGIM28138.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Stay With Me",
                artist: "Sam Smith",
                previewUrl: "http://a1925.phobos.apple.com/us/r1000/014/Music4/v4/04/e8/90/04e89052-205c-151c-f6aa-0524896a78c5/mzaf_4587512940425609541.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music4/v4/e7/55/fa/e755fa2b-01c4-3c6d-1788-fa15ba1eabe8/UMG_cvrart_00602537780211_01_RGB72_1500x1500_13UAEIM58958.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "I'm Not the Only One",
                artist: "Sam Smith",
                previewUrl: "http://a487.phobos.apple.com/us/r1000/014/Music4/v4/9f/21/57/9f215713-22c5-d38d-51d0-d4ad5c20db95/mzaf_7485555379339842337.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music4/v4/e7/55/fa/e755fa2b-01c4-3c6d-1788-fa15ba1eabe8/UMG_cvrart_00602537780211_01_RGB72_1500x1500_13UAEIM58958.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Wake Me Up",
                artist: "Avicii",
                previewUrl: "http://a93.phobos.apple.com/us/r1000/016/Music4/v4/41/50/bd/4150bd63-78ab-89bf-5bb5-0408cac1755a/mzaf_967038708454301735.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Features/v4/9b/3c/ba/9b3cbacd-f7c2-13d0-0a97-af273a5560fb/dj.lmslhwto.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Hey Brother",
                artist: "Avicii",
                previewUrl: "http://a353.phobos.apple.com/us/r1000/000/Music/v4/a4/46/52/a44652f6-0812-144b-b303-44cb3186dcde/mzaf_6548361306007274789.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Features/v4/9b/3c/ba/9b3cbacd-f7c2-13d0-0a97-af273a5560fb/dj.lmslhwto.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Roar",
                artist: "Katy Perry",
                previewUrl: "http://a941.phobos.apple.com/us/r1000/053/Music6/v4/80/ca/98/80ca98ff-1778-db3e-9c02-4290128a2533/mzaf_5034984133495252182.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Features4/v4/f7/3e/40/f73e4011-5ed3-fc65-9107-2438acd70509/dj.hbxrueel.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Dark Horse (feat. Juicy J)",
                artist: "Katy Perry",
                previewUrl: "http://a1930.phobos.apple.com/us/r1000/022/Music/v4/a4/ac/63/a4ac6341-59e3-bcfe-b7f5-370100eea063/mzaf_4835051646631223146.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Features4/v4/f7/3e/40/f73e4011-5ed3-fc65-9107-2438acd70509/dj.hbxrueel.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Wide Awake",
                artist: "Katy Perry",
                previewUrl: "http://a1495.phobos.apple.com/us/r30/Music7/v4/2f/77/27/2f7727d7-9cc3-befd-68e7-8975c33749da/mzaf_4753954315175660933.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music6/v4/fb/4d/22/fb4d2277-ab49-e340-6f23-bdbbb5f764e5/05099932740752.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Good Time",
                artist: "Owl City & Carly Rae Jepsen",
                previewUrl: "http://a1728.phobos.apple.com/us/r1000/092/Music/d9/e3/84/mzi.ddrgyryh.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/dd/df/f3/dddff3d3-431c-e58d-358a-62fe58b264a3/UMG_cvrart_00602537098514_01_RGB72_1200x1200_12UMGIM34863.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                "Everything Is Right",
                artist: "Pooh, Rabbit, Tigger, Piglet, Owl & Christopher Robin",
                previewUrl: "http://a1999.phobos.apple.com/us/r1000/077/Music/83/ba/23/mzm.tvcylyrp.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Features/v4/90/29/d8/9029d8e5-75d8-7990-a795-cf7e82a75f71/V4HttpAssetRepositoryClient-ticket.ptkewlhu.jpg-2831533314535594341.jpg/100x100bb-85.jpg"
            ))

        let realm = Realm()
        realm.write(){
            for music in musicTracks {
                realm.add(music)
            }
        }
    }

    func createRecommendPlaylists(){
        var recommendPlaylists: [Playlist] = []

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

        let realm = Realm()
        realm.write(){
            for playlist in recommendPlaylists {
                realm.add(playlist)
            }
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