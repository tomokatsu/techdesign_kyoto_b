import Foundation
import RealmSwift

class Seeds {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String

    init(){
        if !NSUserDefaults.standardUserDefaults().boolForKey("IsSeedAdded") {
            createRecommendMusicTracks()
            createRecommendPlaylists()
            createFavoriteMusicTracks()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "IsSeedAdded")
        }
    }
    func createRecommendMusicTracks(){
        var musicTracks: [MusicTrack] = []
        musicTracks.append(
            createMusicTrack(
                902149700,
                title: "Little of Your Time",
                artist: "Maroon 5",
                previewUrl: "http://a732.phobos.apple.com/us/r1000/051/Music5/v4/d8/2a/97/d82a9719-c46f-1fd9-e146-878e105bc25d/mzaf_505585141284023317.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music5/v4/24/5d/ce/245dce12-6bab-8d06-4c39-3c65326a8964/UMG_cvrart_00602537943791_01_RGB72_1500x1500_07UMGIM06094.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                536292489,
                title: "One More Night",
                artist: "Maroon 5",
                previewUrl: "http://a400.phobos.apple.com/us/r1000/105/Music/73/d6/9f/mzi.atpuiqko.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/71/77/11/7177118a-7cff-d5a9-430d-87f7292ce758/UMG_cvrart_00602537027064_01_RGB72_1200x1200_12UMGIM26178.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                993351351,
                title: "Sugar",
                artist: "Maroon 5",
                previewUrl: "http://a738.phobos.apple.com/us/r1000/170/Music1/v4/4c/4b/5b/4c4b5bca-1cd9-5847-b36f-7b69d4ef7b31/mzaf_7242500619051641174.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music1/v4/a7/34/be/a734be62-3c4f-84d5-880c-64a8e54113a5/UMG_cvrart_00602547380265_01_RGB72_1500x1500_14UMGIM31673.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                521551806,
                title: "Language",
                artist: "Porter Robinson",
                previewUrl: "http://a1245.phobos.apple.com/us/r1000/076/Music/0c/b1/5e/mzm.pcusjkkb.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/f5/85/10/f58510eb-cbd0-f1c0-6155-f44423562da2/075679961655.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                886319475,
                title: "Sad Machine",
                artist: "Porter Robinson",
                previewUrl: "http://a1382.phobos.apple.com/us/r1000/017/Music/v4/36/83/85/368385bf-a0db-b5e8-8f53-f832687f6c82/mzaf_1392545196903625587.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music6/v4/de/2b/f9/de2bf92f-b265-bff9-2338-c439e82507ec/UMG_cvrart_00602537707331_01_RGB72_1500x1500_14UMGIM24283.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                974822173,
                title: "Spitfire",
                artist: "Porter Robinson",
                previewUrl: "http://a365.phobos.apple.com/us/r1000/136/Music3/v4/25/e7/11/25e7116b-297f-81c4-f36c-093bebaedaa9/mzaf_329617224738583989.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music1/v4/fa/f0/bc/faf0bccc-7b9d-0e90-9a69-1aaabf747c64/075679930309.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                1008306572,
                title: "I Really Like You",
                artist: "Carly Rae Jepsen",
                previewUrl: "http://a1115.phobos.apple.com/us/r1000/052/Music1/v4/c0/54/39/c05439d3-ef52-bc20-ba1b-fd317fff902a/mzaf_2304959405349033865.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music5/v4/df/73/06/df73067e-a48a-c615-fe63-dde6dbcbd87d/UMG_cvrart_00602547455109_01_RGB72_1500x1500_15UMGIM31529.jpg/100x100bb-85.jpg"
            ))

        musicTracks.append(
            createMusicTrack(
                536592205,
                title: "Good Time",
                artist: "Owl City & Carly Rae Jepsen",
                previewUrl: "http://a1728.phobos.apple.com/us/r1000/092/Music/d9/e3/84/mzi.ddrgyryh.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/dd/df/f3/dddff3d3-431c-e58d-358a-62fe58b264a3/UMG_cvrart_00602537098514_01_RGB72_1200x1200_12UMGIM34863.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                907242704,
                title: "Style",
                artist: "Taylor Swift",
                previewUrl: "http://a147.phobos.apple.com/us/r1000/137/Music5/v4/4f/6e/ba/4f6eba13-0b76-6b33-3ee8-48cf4606712d/mzaf_8264677660824429098.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music3/v4/2c/b1/87/2cb187fa-2da2-839e-436a-8997561c0493/UMG_cvrart_00843930013562_01_RGB72_1400x1400_14UMDIM03405.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                571445453,
                title: "I Knew You Were Trouble",
                artist: "Taylor Swift",
                previewUrl: "http://a1689.phobos.apple.com/us/r1000/120/Music/v4/b3/b1/01/b3b101c5-0afd-a536-394d-962b7012e8e1/mzaf_2968645385761922805.aac.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/eb/bc/02/ebbc0219-a3a1-7c77-42ed-706251b98136/UMG_cvrart_00843930007134_01_RGB72_1200x1200_12UMDIM01007.jpg/100x100bb-85.jpg"
            ))

        let realm = Realm(path: "\(documentsPath)/recommend.realm")
        realm.write(){
            for music in musicTracks {
                realm.add(music)
            }
        }

    }

    func createFavoriteMusicTracks(){
        var musicTracks: [MusicTrack] = []
        musicTracks.append(
            createMusicTrack(
                826860759,
                title: "Stay With Me",
                artist: "Sam Smith",
                previewUrl: "http://a1925.phobos.apple.com/us/r1000/014/Music4/v4/04/e8/90/04e89052-205c-151c-f6aa-0524896a78c5/mzaf_4587512940425609541.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music4/v4/e7/55/fa/e755fa2b-01c4-3c6d-1788-fa15ba1eabe8/UMG_cvrart_00602537780211_01_RGB72_1500x1500_13UAEIM58958.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                826860761,
                title: "I'm Not the Only One",
                artist: "Sam Smith",
                previewUrl: "http://a487.phobos.apple.com/us/r1000/014/Music4/v4/9f/21/57/9f215713-22c5-d38d-51d0-d4ad5c20db95/mzaf_7485555379339842337.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music4/v4/e7/55/fa/e755fa2b-01c4-3c6d-1788-fa15ba1eabe8/UMG_cvrart_00602537780211_01_RGB72_1500x1500_13UAEIM58958.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                894102337,
                title: "One Last Time",
                artist: "Ariana Grande",
                previewUrl: "http://a1769.phobos.apple.com/us/r1000/017/Music4/v4/3f/23/57/3f235795-e926-cd0c-365b-688154eb965f/mzaf_520111575490676065.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/52/1b/90/521b904e-6fe1-e54d-97dc-b515983f4f21/UMG_cvrart_00602537939497_01_RGB72_1500x1500_14UMGIM28138.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                677376026,
                title: "Hey Brother",
                artist: "Avicii",
                previewUrl: "http://a353.phobos.apple.com/us/r1000/000/Music/v4/a4/46/52/a44652f6-0812-144b-b303-44cb3186dcde/mzaf_6548361306007274789.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Features/v4/9b/3c/ba/9b3cbacd-f7c2-13d0-0a97-af273a5560fb/dj.lmslhwto.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                922876187,
                title: "Outside (feat. Ellie Goulding)",
                artist: "Calvin Harris",
                previewUrl: "http://a1087.phobos.apple.com/us/r1000/132/Music3/v4/39/96/b1/3996b194-8e3b-b753-095c-796c3763bc5f/mzaf_5108150314547213074.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/a1/b9/c3/a1b9c3e1-3933-cd28-1838-5b4d3d454c43/886444820448.jpg/100x100bb-85.jpg"
            ))

        musicTracks.append(
            createMusicTrack(
                1001677305,
                title: "How Deep Is Your Love",
                artist: "Calvin Harris & Disciples",
                previewUrl: "http://a881.phobos.apple.com/us/r1000/175/Music7/v4/6b/2b/5a/6b2b5a84-1353-470e-e968-b35edbc0e83b/mzaf_1339229786837628269.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music1/v4/b0/2d/f9/b02df9d7-b92c-04fc-2c43-57bed17b2f59/dj.dkdebfmh.jpg/100x100bb-85.jpg"
            ))

        musicTracks.append(
            createMusicTrack(
                570039354,
                title: "Sweet Nothing (feat. Florence Welch)",
                artist: "Calvin Harris",
                previewUrl: "http://a387.phobos.apple.com/us/r1000/078/Music/v4/e1/27/f1/e127f172-b241-a595-5219-38e7b3ac1e2c/mzaf_2946654874177535874.aac.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/v4/2c/00/73/2c0073bb-ba59-2de8-fc23-55230fcfde07/0617465356858.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                922876184,
                title: "Blame (feat. John Newman)",
                artist: "Calvin Harris",
                previewUrl: "http://a10.phobos.apple.com/us/r1000/139/Music3/v4/69/fd/7c/69fd7c44-2540-e49b-0950-b8b2702a0daa/mzaf_2213525356454631945.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/a1/b9/c3/a1b9c3e1-3933-cd28-1838-5b4d3d454c43/886444820448.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                902149884,
                title: "The Sun",
                artist: "Maroon 5",
                previewUrl: "http://a1170.phobos.apple.com/us/r1000/177/Music1/v4/40/00/81/400081cf-7981-2092-9d4d-07b3267fa4d9/mzaf_1049914443254554908.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music3/v4/bc/0a/b3/bc0ab3da-9d18-aa63-9db9-4f8d9276b543/UMG_cvrart_00602537943869_01_RGB72_1500x1500_14UMGIM27076.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                1008306569,
                title: "Run Away with Me",
                artist: "Carly Rae Jepsen",
                previewUrl: "http://a1488.phobos.apple.com/us/r1000/001/Music5/v4/22/53/d3/2253d3de-0b47-c062-697f-2d9c0f284666/mzaf_3847292705466994958.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music5/v4/df/73/06/df73067e-a48a-c615-fe63-dde6dbcbd87d/UMG_cvrart_00602547455109_01_RGB72_1500x1500_15UMGIM31529.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                557469386,
                title: "Call Me Maybe",
                artist: "Carly Rae Jepsen",
                previewUrl: "http://a1083.phobos.apple.com/us/r1000/069/Music/1d/2c/52/mzi.vwfptlpg.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/v4/8f/a7/85/8fa7852d-2020-f2f8-7d0d-9884cbfe47be/UMG_cvrart_00602537164585_01_RGB72_1200x1200_12UMGIM48176.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                690928331,
                title: "Roar",
                artist: "Katy Perry",
                previewUrl: "http://a941.phobos.apple.com/us/r1000/053/Music6/v4/80/ca/98/80ca98ff-1778-db3e-9c02-4290128a2533/mzaf_5034984133495252182.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Features4/v4/f7/3e/40/f73e4011-5ed3-fc65-9107-2438acd70509/dj.hbxrueel.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                716085504,
                title: "Wide Awake",
                artist: "Katy Perry",
                previewUrl: "http://a1495.phobos.apple.com/us/r30/Music7/v4/2f/77/27/2f7727d7-9cc3-befd-68e7-8975c33749da/mzaf_4753954315175660933.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music6/v4/fb/4d/22/fb4d2277-ab49-e340-6f23-bdbbb5f764e5/05099932740752.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                536592205,
                title: "Good Time",
                artist: "Owl City & Carly Rae Jepsen",
                previewUrl: "http://a1728.phobos.apple.com/us/r1000/092/Music/d9/e3/84/mzi.ddrgyryh.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/dd/df/f3/dddff3d3-431c-e58d-358a-62fe58b264a3/UMG_cvrart_00602537098514_01_RGB72_1200x1200_12UMGIM34863.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                403599231,
                title: "Everything Is Right",
                artist: "Pooh, Rabbit, Tigger, Piglet, Owl & Christopher Robin",
                previewUrl: "http://a1999.phobos.apple.com/us/r1000/077/Music/83/ba/23/mzm.tvcylyrp.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Features/v4/90/29/d8/9029d8e5-75d8-7990-a795-cf7e82a75f71/V4HttpAssetRepositoryClient-ticket.ptkewlhu.jpg-2831533314535594341.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                581997309,
                title: "F**kin' Problems (feat. Drake, 2 Chainz & Kendrick Lamar)",
                artist: "A$AP Rocky",
                previewUrl: "http://a1164.phobos.apple.com/us/r1000/102/Music/v4/13/a0/00/13a000ce-9102-5294-2f8f-96af412adb74/mzaf_1270222311776007837.aac.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/v4/91/ef/2e/91ef2eb9-d19c-6c95-9b34-ddcc86fbc4ea/886443746398.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                101729512,
                title: "Alle Jahre wieder",
                artist: "2 Chains",
                previewUrl: "http://a1329.phobos.apple.com/us/r1000/104/Music/d3/e6/14/mzm.jfshjwsy.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/36/39/f0/mzi.vmgdymjr.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                574203655,
                title: "Buy the Cases",
                artist: "Yo Gotti & 2 Chains",
                previewUrl: "http://a1784.phobos.apple.com/us/r30/Music7/v4/bc/c5/02/bcc50278-e7b9-e5c6-d8f3-bc4bb9632686/mzaf_1635069022858916864.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/v4/4d/c9/fa/4dc9fa3f-eac5-233f-da3d-8b5ae845f77e/Cover.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                469591400,
                title: "Think About It",
                artist: "2 Chains",
                previewUrl: "http://a1442.phobos.apple.com/us/r1000/175/Music/83/d3/5b/mzm.lielbklb.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/7e/87/70/mzi.mlcofyac.tif/100x100bb-85.jpg"
            ))

        musicTracks.append(
            createMusicTrack(
                620477616,
                title: "Rich As Fuck (feat. 2 Chainz)",
                artist: "Lil Wayne",
                previewUrl: "http://a464.phobos.apple.com/us/r1000/086/Music/v4/bf/25/79/bf257908-1cad-fee2-f999-cbeb349905d9/mzaf_8102014064216293679.aac.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/b8/cb/66/b8cb66b0-31a4-1394-2577-e2a3403ebb9c/UMG_cvrart_00602537366392_01_RGB72_1500x1500_13UMGIM25908.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                705503646,
                title: "All Me (feat. 2 Chainz & Big Sean)",
                artist: "Drake",
                previewUrl: "http://a1502.phobos.apple.com/us/r1000/039/Music/v4/07/97/20/079720df-6f13-86fd-5167-bed169dd5bc0/mzaf_8011488420315591484.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/1f/e2/ca/1fe2cac4-ef84-c01b-0025-9c9635eadd6d/UMG_cvrart_00602537542338_01_RGB72_1500x1500_13UAAIM79861.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                683600763,
                title: "Bandz a Make Her Dance (feat. 2 Chainz & Lil Wayne)",
                artist: "Juicy J",
                previewUrl: "http://a929.phobos.apple.com/us/r1000/008/Music/v4/21/60/73/216073d8-0ceb-ba96-6337-bcdfaf398750/mzaf_1445119870399739965.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music6/v4/8f/f4/27/8ff4270b-3f53-2a4b-19e6-1600b494843a/886444152013.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                840381890,
                title: "Talk Dirty (feat. 2 Chainz)",
                artist: "Jason Derulo",
                previewUrl: "http://a301.phobos.apple.com/us/r1000/047/Music/v4/07/38/8c/07388c27-d878-5dcd-41b9-bca1b2d776d2/mzaf_8873167061179187812.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/v4/e1/a6/0d/e1a60d60-3932-660d-c8a4-3e96fd6082df/093624938699.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                907242709,
                title: "Bad Blood",
                artist: "Taylor Swift",
                previewUrl: "http://a1968.phobos.apple.com/us/r1000/026/Music3/v4/1b/30/04/1b300454-1cec-b50d-29dd-60ad351c1b3b/mzaf_3536997228152797622.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music3/v4/2c/b1/87/2cb187fa-2da2-839e-436a-8997561c0493/UMG_cvrart_00843930013562_01_RGB72_1400x1400_14UMDIM03405.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                295757256,
                title: "You Belong With Me",
                artist: "Taylor Swift",
                previewUrl: "http://a955.phobos.apple.com/us/r1000/105/Music/c0/77/58/mzm.mwxzkcck.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Features/aa/57/c7/dj.fmlajvtr.jpg/100x100bb-85.jpg"
            ))
        musicTracks.append(
            createMusicTrack(
                512360314,
                title: "Beez In the Trap (feat. 2 Chainz)",
                artist: "Nicki Minaj",
                previewUrl: "http://a1181.phobos.apple.com/us/r1000/076/Music/7d/4b/6e/mzm.tiadbvvm.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/v4/34/13/02/341302ce-99ff-c788-c1b4-44d9358e53c0/UMG_cvrart_00602537011018_01_RGB72_1200x1200_12UMGIM12514.jpg/100x100bb-85.jpg"
            ))


        let realm = Realm(path: "\(documentsPath)/favorite.realm")
        realm.write(){
            for music in musicTracks {
                realm.add(music)
            }
        }
    }

    func createRecommendPlaylists(){
        var recommendPlaylists: [Playlist] = []
        var playlist: Playlist = Playlist()

        playlist = createPlaylist("俺のBest HOUSE MUSIC", comment: "とりあえず聴いてくれ、これだけは。", playlister: "DJ TAMURA", inspireNumber: 127, userImageUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                826860759,
                title: "Stay With Me",
                artist: "Sam Smith",
                previewUrl: "http://a1925.phobos.apple.com/us/r1000/014/Music4/v4/04/e8/90/04e89052-205c-151c-f6aa-0524896a78c5/mzaf_4587512940425609541.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music4/v4/e7/55/fa/e755fa2b-01c4-3c6d-1788-fa15ba1eabe8/UMG_cvrart_00602537780211_01_RGB72_1500x1500_13UAEIM58958.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                948910055,
                title: "United We Are",
                artist: "Hardwell",
                previewUrl: "http://a269.phobos.apple.com/us/r1000/135/Music5/v4/4b/b0/55/4bb05579-7ffe-f6ec-664d-ed4c254b8256/mzaf_9175290839896019775.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music7/v4/72/09/64/72096460-f1fe-87c7-d6f1-879da4545400/dj.rqncfptk.png/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                555765362,
                title: "The City",
                artist: "Madeon",
                previewUrl: "http://a1055.phobos.apple.com/us/r1000/086/Music/6c/98/a7/mzi.jkxjlpkl.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/38/ee/1e/38ee1ef2-1db4-e67c-771f-4ea266888e0e/886443631991.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                331340577,
                title: "Bulletproof",
                artist: "La Roux",
                previewUrl: "http://a516.phobos.apple.com/us/r1000/106/Music/c6/72/58/mzm.iiudobyf.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/23/03/33/mzi.zwkjaqnl.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                984746629,
                title: "Runaway (U & I)",
                artist: "Galantis",
                previewUrl: "http://a1750.phobos.apple.com/us/r1000/173/Music7/v4/ff/40/0b/ff400b37-72c9-0626-b712-f50c59b320ab/mzaf_1961100107369173433.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music5/v4/56/f6/07/56f60706-2487-dd0e-13a4-f11e587d8c15/075679933652.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                922876189,
                title: "Summer",
                artist: "Calvin Harris",
                previewUrl: "http://a1662.phobos.apple.com/us/r1000/148/Music3/v4/00/68/2d/00682db3-2ac5-1320-12e7-7563114dcc13/mzaf_3600077081028515285.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/a1/b9/c3/a1b9c3e1-3933-cd28-1838-5b4d3d454c43/886444820448.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                1001771045,
                title: "Omen (feat. Sam Smith)",
                artist: "Disclosure",
                previewUrl: "http://a729.phobos.apple.com/us/r1000/154/Music5/v4/f4/23/1e/f4231ec9-38d3-f7d6-5020-d459f076c6e7/mzaf_3802534100236002708.plus.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music1/v4/05/9f/fe/059ffeff-8a92-ec7f-77e4-6210c5392f0a/UMG_cvrart_00602547432469_01_RGB72_1500x1500_15UMGIM29141.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                922876187,
                title: "Outside (feat. Ellie Goulding)",
                artist: "Calvin Harris",
                previewUrl: "http://a1087.phobos.apple.com/us/r1000/132/Music3/v4/39/96/b1/3996b194-8e3b-b753-095c-796c3763bc5f/mzaf_5108150314547213074.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/a1/b9/c3/a1b9c3e1-3933-cd28-1838-5b4d3d454c43/886444820448.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("センチメンタルな気分をぶち壊したい時に", comment: "これ以上良い8曲は選べないよ", playlister: "DJ MIURA", inspireNumber: 324, userImageUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/minipunk/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                894102341,
                title: "Break Free (feat. Zedd)",
                artist: "Ariana Grande",
                previewUrl: "http://a932.phobos.apple.com/us/r1000/007/Music4/v4/07/bf/61/07bf611d-98ee-e543-6471-d8297d323bff/mzaf_3525907358363476631.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/52/1b/90/521b904e-6fe1-e54d-97dc-b515983f4f21/UMG_cvrart_00602537939497_01_RGB72_1500x1500_14UMGIM28138.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                947648731,
                title: "The Night Is Still Young",
                artist: "Nicki Minaj",
                previewUrl: "http://a582.phobos.apple.com/us/r1000/143/Music1/v4/6e/62/95/6e629517-9ded-3fb7-354f-dd575c1530af/mzaf_6270104156011407497.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music3/v4/c3/5c/3c/c35c3c0a-c9d8-f7ca-72a6-b0302be8f5d2/UMG_cvrart_00602547175663_01_RGB72_1500x1500_14UMGIM59293.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                403927937,
                title: "Super Bass",
                artist: "Nicki Minaj",
                previewUrl: "http://a1594.phobos.apple.com/us/r1000/158/Music3/v4/14/81/09/148109ee-140e-f711-0b53-6b0dd005a379/mzaf_6761370264200306936.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music1/v4/e5/d1/f2/e5d1f271-307e-e6f7-e41d-983c6bca09d0/dj.tfwfndcw.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                315025823,
                title: "Complicated",
                artist: "Avril Lavigne",
                previewUrl: "http://a1657.phobos.apple.com/us/r1000/105/Music/15/d9/48/mzm.cjhohfuf.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/3b/19/57/mzi.ocuvsuca.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                878802275,
                title: "What the Hell",
                artist: "Avril Lavigne",
                previewUrl: "http://a760.phobos.apple.com/us/r1000/118/Music/ea/22/34/mzm.ejuvnzfx.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/6a/20/d9/mzi.ggggjiqc.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                947648623,
                title: "Only (feat. Drake, Lil Wayne & Chris Brown)",
                artist: "Nicki Minaj",
                previewUrl: "http://a1104.phobos.apple.com/us/r1000/167/Music5/v4/5c/fa/50/5cfa50ac-541b-7449-c664-d3dcd6e90be6/mzaf_5037250707673819328.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music3/v4/c3/5c/3c/c35c3c0a-c9d8-f7ca-72a6-b0302be8f5d2/UMG_cvrart_00602547175663_01_RGB72_1500x1500_14UMGIM59293.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                215937113,
                title: "Girlfriend",
                artist: "Avril Lavigne",
                previewUrl: "http://a532.phobos.apple.com/us/r1000/090/Music/b0/2a/0e/mzm.rsqnxqhi.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/fa/81/d5/mzi.zoeulxey.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                894102336,
                title: "Problem (feat. Iggy Azalea)",
                artist: "Ariana Grande",
                previewUrl: "http://a1119.phobos.apple.com/us/r1000/159/Music3/v4/d8/32/23/d832232e-ecda-db63-4aa6-5fc135e290d9/mzaf_4084389937804403765.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music4/v4/52/1b/90/521b904e-6fe1-e54d-97dc-b515983f4f21/UMG_cvrart_00602537939497_01_RGB72_1500x1500_14UMGIM28138.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("クラブに行く前におすすめの曲達", comment: "予習くらいしていけよな！", playlister: "DJ SHIMBO", inspireNumber: 154, userImageUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/ladylexy/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                565825199,
                title: "Clarity (feat. Foxes)",
                artist: "Zedd",
                previewUrl: "http://a941.phobos.apple.com/us/r1000/090/Music/43/3a/f7/mzi.oazcabkj.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/v4/f3/ff/e0/f3ffe00d-cef9-99a1-2cf8-f22b07bf7c04/UMG_cvrart_00602537173204_01_RGB72_1200x1200_12UMGIM52120.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                669200554,
                title: "Titanium (feat. Sia)",
                artist: "David Guetta",
                previewUrl: "http://a70.phobos.apple.com/us/r1000/053/Music3/v4/61/0b/cc/610bcca2-af06-a760-60d9-7d223c3e1f03/mzaf_1420637825422114821.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music4/v4/05/8c/e5/058ce5a6-b091-18fe-adbb-7356d5ab3e42/dj.thrvmjqj.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                613185021,
                title: "Diane Young",
                artist: "Vampire Weekend",
                previewUrl: "http://a91.phobos.apple.com/us/r1000/075/Music2/v4/0d/67/97/0d679755-8179-0457-84e6-caa664ae89fe/mzaf_6328299204474856517.aac.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music2/v4/1e/44/17/1e441710-625e-4cf4-f6f4-8d721b737f7d/Vamprie_Weekend_-_Modern_Vampires.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                1498912,
                title: "Ten Feet Tall (feat. Wrabel)",
                artist: "Afrojack",
                previewUrl: "http://a549.phobos.apple.com/us/r1000/017/Music4/v4/14/9c/eb/149ceb26-b487-6b63-f5ea-486757bc7302/mzaf_7699120119172273034.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music4/v4/c4/10/19/c41019cf-622e-d4f0-edb9-09509adc9b3e/UMG_cvrart_00602537818792_01_RGB72_1500x1500_14UMGIM11384.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                322447692,
                title: "Don't You Worry Child (feat. John Martin)",
                artist: "Swedish House Mafia",
                previewUrl: "http://a1305.phobos.apple.com/us/r30/Music/v4/e3/9b/7b/e39b7bec-466b-8ed3-6b90-4bf15e4ec82d/mzaf_1294172699871782380.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/5a/17/a2/5a17a21d-1401-596c-d522-e27850b78ce4/05099923236356.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                984317041,
                title: "Beautiful Now (feat. Jon Bellion)",
                artist: "Zedd",
                previewUrl: "http://a1202.phobos.apple.com/us/r1000/018/Music1/v4/be/30/89/be308939-e1c1-da3b-3874-174f5616ed49/mzaf_6304857368530244341.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music3/v4/a2/1a/21/a21a21dd-5e56-cbce-0424-daf9b85eb60e/UMG_cvrart_00602547351814_01_RGB72_1500x1500_15UMGIM20773.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                696510598,
                title: "Stay the Night (feat. Hayley Williams of Paramore)",
                artist: "Zedd",
                previewUrl: "http://a1608.phobos.apple.com/us/r1000/035/Music/v4/2e/66/be/2e66be14-8ef3-74d5-1fcf-0252ed6d84cf/mzaf_4598470213594623350.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music4/v4/07/61/6d/07616deb-3166-0a53-7496-6ffb931b22eb/UMG_cvrart_00602537458318_01_RGB72_1800x1800_13UAAIM75149.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                984317031,
                title: "I Want You to Know (feat. Selena Gomez)",
                artist: "Zedd",
                previewUrl: "http://a653.phobos.apple.com/us/r1000/177/Music7/v4/f2/83/d4/f283d45c-5bd3-cec6-609d-657af6ec81e1/mzaf_1270101351839710.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music3/v4/a2/1a/21/a21a21dd-5e56-cbce-0424-daf9b85eb60e/UMG_cvrart_00602547351814_01_RGB72_1500x1500_15UMGIM20773.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("洋楽 ~Best Of The Mix", comment: "Pitbull & Ne-Yo / Pitbull / Hardwell / Apollo / Hardwell / Hardwell /Pitbull / Pitbull", playlister: "mikematas", inspireNumber: 45, userImageUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/kolage/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                933984166,
                title: "Time of Our Lives",
                artist: "Pitbull & Ne-Yo",
                previewUrl: "http://a912.phobos.apple.com/us/r1000/058/Music1/v4/31/7c/c5/317cc5a6-aff3-7a01-2563-bcd564f2d87d/mzaf_2316343798964667052.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music5/v4/a2/e7/f2/a2e7f233-7407-609a-3cac-115046332f16/886444753852.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                737053283,
                title: "Timber (feat. Ke$ha)",
                artist: "Pitbull",
                previewUrl: "http://a128.phobos.apple.com/us/r1000/044/Music6/v4/a5/5b/6c/a55b6c6c-4ff7-ddeb-53af-8ff9c5064d3e/mzaf_8149591756865852525.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music6/v4/a2/ca/19/a2ca198d-4277-13ae-834d-ea6bed0b6083/886444305686.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                451476251,
                title: "Encoded (Original Mix)",
                artist: "Hardwell",
                previewUrl: "http://a180.phobos.apple.com/us/r1000/078/Music/v4/bf/b2/eb/bfb2ebc3-1952-901a-b647-900ead4406d4/mzaf_8189491155969250753.aac.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/cd/14/b1/mzi.pmaqddkk.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                658602106,
                title: "Apollo (feat. Amba Shepherd)",
                artist: "Hardwell",
                previewUrl: "http://a1032.phobos.apple.com/us/r30/Music4/v4/55/b9/c8/55b9c88e-18f2-a7d6-4b24-ce9ab8b8d7f6/mzaf_3005698206581632048.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music2/v4/94/9d/68/949d680c-2b2b-434f-8549-9ff4017c3404/5060312619333.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                964603354,
                title: "Young Again (feat. Chris Jones)",
                artist: "Hardwell",
                previewUrl: "http://a974.phobos.apple.com/us/r1000/131/Music3/v4/46/8f/92/468f9234-1d12-a142-9ef7-5890ceb3c955/mzaf_6721617467299562188.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music3/v4/db/32/7e/db327e3a-ccee-3259-1810-7eefdaa6e819/0617465587559.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                742014425,
                title: "Apollo (feat. Amba Shepherd)",
                artist: "Hardwell",
                previewUrl: "http://a442.phobos.apple.com/us/r1000/002/Music/v4/b8/76/f4/b876f423-40d6-7954-911b-086700449e07/mzaf_4277455245815627830.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music6/v4/f7/a0/c5/f7a0c591-8b18-4dda-5cce-2a5154545f92/8718521021733.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                440733073,
                title: "My Kinda Girl (feat. Nelly)",
                artist: "Pitbull",
                previewUrl: "http://a886.phobos.apple.com/us/r1000/110/Music/60/76/35/mzm.qikfvzex.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/d8/0a/fe/mzi.titldtwy.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                933984097,
                title: "Fireball (feat. John Ryan)",
                artist: "Pitbull",
                previewUrl: "http://a742.phobos.apple.com/us/r1000/055/Music3/v4/d6/fc/95/d6fc95ad-0a81-129b-b0d8-91c0d9462365/mzaf_3154331375211884726.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music5/v4/a2/e7/f2/a2e7f233-7407-609a-3cac-115046332f16/886444753852.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("クラブが嫌いな人でも聴いてほしい", comment: "本当にオススメの曲だけを集めたよ！", playlister: "Alex", inspireNumber: 67, userImageUrl:"https://s3.amazonaws.com/uifaces/faces/twitter/mutlu82/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                482734113,
                title: "What Makes You Beautiful",
                artist: "One Direction",
                previewUrl: "http://a725.phobos.apple.com/us/r1000/071/Music/60/31/bb/mzm.jdguvcvo.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music5/v4/e3/02/f7/e302f73b-95e4-6f32-7ec5-a74f60be7c11/dj.dqbxwvpe.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                1024077721,
                title: "Drag Me Down",
                artist: "One Direction",
                previewUrl: "http://a1905.phobos.apple.com/us/r1000/166/Music7/v4/4e/f6/99/4ef69941-2035-be9e-2b5e-57120997274a/mzaf_1698488009618091795.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music69/v4/cd/ab/ed/cdabede1-729b-a1bf-43be-c30d6cf73948/dj.rnfimcca.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                563475531,
                title: "Live While We're Young",
                artist: "One Direction",
                previewUrl: "http://a56.phobos.apple.com/us/r1000/104/Music/03/b3/25/mzi.hrkcaamf.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/v4/38/56/63/385663c9-c2c5-65d3-f65a-56c1d443537a/886443625815.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                574406658,
                title: "Kiss You",
                artist: "One Direction",
                previewUrl: "http://a1262.phobos.apple.com/us/r1000/089/Music/v4/d9/99/62/d999620c-3efe-f14d-cb6e-e31648dd68c0/mzaf_4449797957425274315.aac.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/4d/df/20/4ddf20ea-9628-ef38-ce5c-cd45aa0d9404/886443503175.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                695318302,
                title: "Story of My Life",
                artist: "One Direction",
                previewUrl: "http://a10.phobos.apple.com/us/r1000/001/Music4/v4/e2/d1/13/e2d1130a-ad4f-c90f-7af6-5d8f3d1114b8/mzaf_1424600187937384144.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Features6/v4/67/6b/b3/676bb348-7291-7b89-0149-4ad6f7befa28/dj.fuklqvvg.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                914556579,
                title: "Night Changes",
                artist: "One Direction",
                previewUrl: "http://a1837.phobos.apple.com/us/r1000/156/Music3/v4/ea/67/b9/ea67b916-e23e-789d-6592-52ea9e2cb361/mzaf_8083725630267975729.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music5/v4/64/56/c8/6456c847-7afc-5d1f-4c7f-f3b7ee6b23d2/dj.ljogvxod.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                914556572,
                title: "Steal My Girl",
                artist: "One Direction",
                previewUrl: "http://a1895.phobos.apple.com/us/r1000/002/Music3/v4/a7/8e/68/a78e6843-8cc2-5be0-3900-bbf95e62a0bc/mzaf_7403043370196925683.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music5/v4/64/56/c8/6456c847-7afc-5d1f-4c7f-f3b7ee6b23d2/dj.ljogvxod.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                482734115,
                title: "One Thing",
                artist: "One Direction",
                previewUrl: "http://a446.phobos.apple.com/us/r1000/060/Music/3c/92/f7/mzm.ajckwzji.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music5/v4/e3/02/f7/e302f73b-95e4-6f32-7ec5-a74f60be7c11/dj.dqbxwvpe.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("運転中にオススメなEDM集", comment: "テンション上がってスピード出し過ぎるなよな！", playlister: "Saori", inspireNumber: 83, userImageUrl:"https://s3.amazonaws.com/uifaces/faces/twitter/uxceo/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                480054438,
                title: "Levels",
                artist: "Avicii",
                previewUrl: "http://a805.phobos.apple.com/us/r1000/071/Music/3b/2d/ac/mzm.wtdviygy.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/e6/09/04/mzi.ybhssean.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                943278975,
                title: "The Nights",
                artist: "Avicii",
                previewUrl: "http://a1227.phobos.apple.com/us/r1000/038/Music1/v4/be/f7/3b/bef73bd4-353c-96d5-190c-79ce57a352ed/mzaf_6859011514517975855.plus.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music3/v4/f4/d3/fe/f4d3fedf-0e1b-7778-f96f-00246df5f521/UMG_cvrart_00602547155696_01_RGB72_1500x1500_14UMGIM56567.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                677376027,
                title: "Addicted To You",
                artist: "Avicii",
                previewUrl: "http://a455.phobos.apple.com/us/r1000/054/Music6/v4/fc/42/ac/fc42acac-299a-2ae9-08e6-51da57582865/mzaf_6016534246351768212.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Features/v4/9b/3c/ba/9b3cbacd-f7c2-13d0-0a97-af273a5560fb/dj.lmslhwto.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                638521124,
                title: "I Could Be the One (Avicii vs Nicky Romero)",
                artist: "Avicii & Nicky Romero",
                previewUrl: "http://a1912.phobos.apple.com/us/r1000/078/Music2/v4/d9/77/49/d9774925-5be2-f0f0-44f1-39e3cc196d36/mzaf_7273581115841784365.aac.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/v4/f6/d6/5e/f6d65e06-304b-df44-3437-14f26c869bcd/UMG_cvrart_00602537278398_01_RGB72_1500x1500_12UMGIM64887.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                878802275,
                title: "Fade Into Darkness (Vocal Club Mix)",
                artist: "Avicii",
                previewUrl: "http://a1601.phobos.apple.com/us/r1000/087/Music/8c/12/85/mzm.gcfpywqm.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/33/55/f3/mzi.suamolgm.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                677376026,
                title: "Hey Brother",
                artist: "Avicii",
                previewUrl: "http://a353.phobos.apple.com/us/r1000/000/Music/v4/a4/46/52/a44652f6-0812-144b-b303-44cb3186dcde/mzaf_6548361306007274789.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Features/v4/9b/3c/ba/9b3cbacd-f7c2-13d0-0a97-af273a5560fb/dj.lmslhwto.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                487946086,
                title: "Levels",
                artist: "Avicii",
                previewUrl: "http://a9.phobos.apple.com/us/r1000/063/Music/99/59/8a/mzm.rblgliqa.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/b7/92/84/mzi.xfmsjidp.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                677376025,
                title: "You Make Me",
                artist: "Avicii",
                previewUrl: "http://a914.phobos.apple.com/us/r1000/053/Music/v4/5a/37/68/5a3768b8-a4a2-f934-63e1-9424c63b2c72/mzaf_542549507245392673.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Features/v4/9b/3c/ba/9b3cbacd-f7c2-13d0-0a97-af273a5560fb/dj.lmslhwto.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("Maroon 5を中心におしゃれな曲を集めてみた", comment: "シャレオツや", playlister: "kent", inspireNumber: 293, userImageUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/claudioguglieri/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                542469000,
                title: "Love Somebody",
                artist: "Maroon 5",
                previewUrl: "http://a387.phobos.apple.com/us/r1000/101/Music/56/53/b2/mzi.nogsektx.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/db/8c/c8/db8cc841-47a0-2845-5116-e1762dbd711e/UMG_cvrart_00602537109692_01_RGB72_1200x1200_12UMGIM26178.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                902147882,
                title: "She Will Be Loved",
                artist: "Maroon 5",
                previewUrl: "http://a663.phobos.apple.com/us/r1000/124/Music5/v4/74/b6/43/74b6433c-103a-de1f-407f-61944289131c/mzaf_6071438917600161334.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music3/v4/bc/0a/b3/bc0ab3da-9d18-aa63-9db9-4f8d9276b543/UMG_cvrart_00602537943869_01_RGB72_1500x1500_14UMGIM27076.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                902149699,
                title: "Makes Me Wonder",
                artist: "Maroon 5",
                previewUrl: "http://a637.phobos.apple.com/us/r1000/128/Music3/v4/a9/60/ea/a960eac1-515d-d625-485d-b73975219e3a/mzaf_5925012465926639536.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music5/v4/24/5d/ce/245dce12-6bab-8d06-4c39-3c65326a8964/UMG_cvrart_00602537943791_01_RGB72_1500x1500_07UMGIM06094.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                536292498,
                title: "If I Never See Your Face Again (feat. Rihanna)",
                artist: "Maroon 5 feat. Rihanna",
                previewUrl: "http://a1662.phobos.apple.com/us/r1000/117/Music/41/89/08/mzm.ssvsbpls.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Features/ae/10/7e/dj.ugxeeiml.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                902111717,
                title: "Moves Like Jagger (feat. Christina Aguilera)",
                artist: "Maroon 5",
                previewUrl: "http://a902.phobos.apple.com/us/r1000/122/Music5/v4/25/5d/ef/255def7e-b41e-d551-a141-f75e142a7c7a/mzaf_824783162342211917.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music3/v4/e3/61/25/e361251b-3ca7-8878-fc9c-3b53c8f674dc/UMG_cvrart_00602537943937_01_RGB72_1406x1406_14UMGIM27067.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                993352744,
                title: "Sugar",
                artist: "Maroon 5",
                previewUrl: "http://a896.phobos.apple.com/us/r1000/001/Music5/v4/b5/5d/8b/b55d8bca-78b8-ed19-d241-ba725f89de50/mzaf_3660745207759028150.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music7/v4/4a/da/53/4ada5368-ab4b-6cca-e877-95e0dccdf9b3/UMG_cvrart_00602547380272_01_RGB72_1500x1500_14UMGIM31675.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                542468974,
                title: "Daylight",
                artist: "Maroon 5",
                previewUrl: "http://a1852.phobos.apple.com/us/r1000/117/Music/72/28/8d/mzi.rjwrbxee.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/db/8c/c8/db8cc841-47a0-2845-5116-e1762dbd711e/UMG_cvrart_00602537109692_01_RGB72_1200x1200_12UMGIM26178.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                542468961,
                title: "Payphone (feat. Wiz Khalifa)",
                artist: "Maroon 5",
                previewUrl: "http://a333.phobos.apple.com/us/r1000/082/Music/ea/be/fd/mzi.zaujodbn.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/v4/db/8c/c8/db8cc841-47a0-2845-5116-e1762dbd711e/UMG_cvrart_00602537109692_01_RGB72_1200x1200_12UMGIM26178.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("Dirty Vegas", comment: "Dirty Vegasいいね", playlister: "george", inspireNumber: 78, userImageUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/michzen/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                699729587,
                title: "Days Go By (Acoustic)",
                artist: "Dirty Vegas",
                previewUrl: "http://a333.phobos.apple.com/us/r1000/130/Music3/v4/d6/f3/e4/d6f3e4da-fea5-6b2e-9233-5a87a895078b/mzaf_1107842953333490643.plus.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music6/v4/42/77/22/427722e3-5875-c60c-0125-5a9f25b8cd72/dj.pcgelofg.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                307201729,
                title: "Pressure (Sultan & Ned Shepard Mix)",
                artist: "Dirty Vegas",
                previewUrl: "http://a1376.phobos.apple.com/us/r1000/060/Music2/v4/b5/ee/1e/b5ee1e64-b474-9d13-e930-20310731337c/mzaf_2379422896259328986.aac.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music/b5/af/77/mzi.awoywbym.tif/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                322180998,
                title: "Tonight (IMS Anthem 2009, Pt. 1) [Above & Beyond Remix]",
                artist: "Dirty Vegas",
                previewUrl: "http://a1780.phobos.apple.com/us/r30/Music/v4/49/b2/5e/49b25eea-9150-d62d-9674-a6ba7d5205a8/mzaf_5418926586052035271.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/a4/75/36/mzi.ljxynrkg.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                1023688417,
                title: "Photograph",
                artist: "Dirty Vegas",
                previewUrl: "http://a1419.phobos.apple.com/us/r1000/125/Music7/v4/b9/ed/ee/b9edee8b-dff1-843d-7364-913591456f3b/mzaf_9189618746803100209.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music7/v4/b7/e2/cd/b7e2cde6-b430-47b9-60c3-82f0f9662fa6/8014090075819.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                207539898,
                title: "Late Nights and Street Fights (Main Title Theme from Standoff)",
                artist: "Dirty Vegas",
                previewUrl: "http://a1973.phobos.apple.com/us/r1000/073/Music/v4/c4/aa/8e/c4aa8e22-c9da-dd0a-afd6-42b3cf89d3b5/mzaf_7731706612355389533.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/c1/d5/51/mzi.edtcwhfr.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                699729005,
                title: "Days Go By",
                artist: "Dirty Vegas",
                previewUrl: "http://a266.phobos.apple.com/us/r1000/177/Music3/v4/95/83/de/9583de30-255c-cc56-a9f9-fa7a7830b455/mzaf_5114018111612632875.plus.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music6/v4/42/77/22/427722e3-5875-c60c-0125-5a9f25b8cd72/dj.pcgelofg.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                429520728,
                title: "Little White Doves",
                artist: "Dirty Vegas",
                previewUrl: "http://a1042.phobos.apple.com/us/r30/Music/d1/32/b1/mzm.yefckcow.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/cd/4c/82/mzi.pvlazjcn.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                699729503,
                title: "Simple Things, Pt. 2",
                artist: "Dirty Vegas",
                previewUrl: "http://a60.phobos.apple.com/us/r1000/168/Music69/v4/f0/ea/ab/f0eaab35-481b-dd7e-e214-81deb5282d41/mzaf_1191874371790944372.plus.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music6/v4/42/77/22/427722e3-5875-c60c-0125-5a9f25b8cd72/dj.pcgelofg.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("La Rouxって懐かしいよね", comment: "La Rouxの曲を集めたよ", playlister: "ケン", inspireNumber: 124, userImageUrl:"https://s3.amazonaws.com/uifaces/faces/twitter/joelbirch47/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                331340577,
                title: "Bulletproof",
                artist: "La Roux",
                previewUrl: "http://a516.phobos.apple.com/us/r1000/106/Music/c6/72/58/mzm.iiudobyf.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/23/03/33/mzi.zwkjaqnl.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                587763849,
                title: "Bulletproof",
                artist: "La Roux",
                previewUrl: "http://a704.phobos.apple.com/us/r1000/118/Music/d1/18/ca/mzm.ndfrcsyz.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music/7b/aa/1a/mzi.elevieve.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                391569892,
                title: "In for the Kill",
                artist: "La Roux",
                previewUrl: "http://a289.phobos.apple.com/us/r1000/087/Music/b0/51/07/mzm.bojqvwkx.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music/8e/d6/a7/mzi.zozinerc.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                311213337,
                title: "In for the Kill",
                artist: "La Roux",
                previewUrl: "http://a310.phobos.apple.com/us/r1000/103/Music/12/73/58/mzm.auhpzmfh.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/8d/69/70/mzi.qcukialc.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                876563622,
                title: "Uptight Downtown",
                artist: "La Roux",
                previewUrl: "http://a417.phobos.apple.com/us/r1000/006/Music6/v4/1c/3f/36/1c3f36aa-348c-de70-f59c-74dc37f0f9a0/mzaf_2218076515900107862.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music2/v4/6d/8c/35/6d8c358c-f2a2-d9dc-aabe-2e1057e497e2/UMG_cvrart_00602537864058_01_RGB72_1500x1500_14UMGIM17774.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                331340589,
                title: "Cover My Eyes",
                artist: "La Roux",
                previewUrl: "http://a1481.phobos.apple.com/us/r1000/099/Music/34/ae/6a/mzm.gbcmwvcg.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/23/03/33/mzi.zwkjaqnl.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                331340608,
                title: "Fascination",
                artist: "La Roux",
                previewUrl: "http://a1049.phobos.apple.com/us/r1000/102/Music/e0/26/26/mzm.eyruvyvt.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/23/03/33/mzi.zwkjaqnl.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                331340658,
                title: "Armour Love",
                artist: "La Roux",
                previewUrl: "http://a1619.phobos.apple.com/us/r1000/099/Music/ca/58/18/mzm.svettafs.aac.p.m4a",
                artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/23/03/33/mzi.zwkjaqnl.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)

        playlist = createPlaylist("Sleepy Tomって知ってる？", comment: "本当にいい曲ばかりだから聴いてみて！", playlister: "John", inspireNumber: 23, userImageUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/soyjavi/48.jpg")
        playlist.musicTracks.append(
            createMusicTrack(
                1008393092,
                title: "Pusher (feat. Anna Lunoe)",
                artist: "Sleepy Tom",
                previewUrl: "http://a354.phobos.apple.com/us/r1000/000/Music7/v4/7b/3e/6e/7b3e6ed1-3143-5117-9295-31abe6608072/mzaf_8240233671600320266.plus.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music7/v4/9f/6c/5a/9f6c5ab0-af3d-b23e-9062-a099ebb0b0e2/851004006389.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                1013837342,
                title: "I Want Your Soul",
                artist: "Sleepy Tom",
                previewUrl: "http://a740.phobos.apple.com/us/r20/Music5/v4/1e/03/68/1e0368a7-8619-169a-312b-a7dcd694a88c/mzaf_3305022332464781397.plus.aac.p.m4a",
                artworkUrl: "http://is5.mzstatic.com/image/thumb/Music7/v4/cc/d4/79/ccd47924-4003-cfcd-a09a-bb0795f24dd6/8712944477979.png/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                1033707950,
                title: "Be Right There",
                artist: "Diplo & Sleepy Tom",
                previewUrl: "http://a232.phobos.apple.com/us/r1000/166/Music49/v4/37/77/2e/37772ec7-5638-ba2c-3440-60fac27354b7/mzaf_4425157510400095443.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music69/v4/36/c3/7b/36c37b94-fdd6-ff17-c7da-1d0bd40f8d27/Be-right-there-final_1800px_2.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                649549387,
                title: "Let It Go",
                artist: "Sleepy Tom",
                previewUrl: "http://a1760.phobos.apple.com/us/r1000/030/Music6/v4/b7/5e/3a/b75e3a1e-a0e9-0c3b-2937-308ec4ee805f/mzaf_1739444675904233299.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/64/6f/57/646f57da-aef9-9507-0cb7-88951eba5a50/856730003930.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                698636010,
                title: "Champions",
                artist: "Sleepy Tom",
                previewUrl: "http://a1112.phobos.apple.com/us/r1000/043/Music7/v4/7d/55/92/7d5592df-aefc-aed4-26d7-d7506e687157/mzaf_7787549482869368246.plus.aac.p.m4a",
                artworkUrl: "http://is2.mzstatic.com/image/thumb/Music7/v4/1e/d1/5b/1ed15bcf-6ce4-f6ec-7c21-32dcb84eb9f1/889176912948.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                649549429,
                title: "The Currency",
                artist: "Sleepy Tom",
                previewUrl: "http://a935.phobos.apple.com/us/r1000/047/Music6/v4/c9/f8/5d/c9f85d79-8d3e-e8ea-7ad5-9ce192a81dbf/mzaf_9130387742879414563.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/64/6f/57/646f57da-aef9-9507-0cb7-88951eba5a50/856730003930.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                649549430,
                title: "Throwing Plates",
                artist: "Sleepy Tom",
                previewUrl: "http://a1038.phobos.apple.com/us/r1000/053/Music4/v4/4c/fe/8e/4cfe8e8d-4fdf-87e7-4294-7d8778513c8c/mzaf_3137488239081851250.plus.aac.p.m4a",
                artworkUrl: "http://is1.mzstatic.com/image/thumb/Music/v4/64/6f/57/646f57da-aef9-9507-0cb7-88951eba5a50/856730003930.jpg/100x100bb-85.jpg"
            ))
        playlist.musicTracks.append(
            createMusicTrack(
                1008393093,
                title: "Pusher (feat. Anna Lunoe) [Branchez Remix]",
                artist: "Sleepy Tom",
                previewUrl: "http://a1740.phobos.apple.com/us/r1000/145/Music1/v4/65/fe/11/65fe1162-e4f1-31a7-660f-4f8115f06de1/mzaf_4164327155421126802.plus.aac.p.m4a",
                artworkUrl: "http://is3.mzstatic.com/image/thumb/Music7/v4/9f/6c/5a/9f6c5ab0-af3d-b23e-9062-a099ebb0b0e2/851004006389.jpg/100x100bb-85.jpg"
            ))
        recommendPlaylists.append(playlist)


        let realm = Realm()
        realm.write(){
            for playlist in recommendPlaylists {
                realm.add(playlist)
            }
        }
    }


    func createPlaylist(title: String, comment: String, playlister: String, inspireNumber: Int, userImageUrl: String) -> Playlist{
        var playlist = Playlist()
        playlist.title = title
        playlist.comment = comment
        playlist.playlister = playlister
        playlist.inspiredNumber = inspireNumber
        playlist.userImageURL = userImageUrl

        return playlist
    }

    func createMusicTrack(trackId: Int, title: String, artist: String, previewUrl: String, artworkUrl: String) -> MusicTrack{
        var musicTrack: MusicTrack = MusicTrack()
        musicTrack.trackId = trackId
        musicTrack.title = title
        musicTrack.artist = artist
        musicTrack.previewUrl = previewUrl
        musicTrack.artworkUrl = artworkUrl

        return musicTrack
    }
}