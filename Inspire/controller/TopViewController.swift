import UIKit
import RealmSwift

class TopViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    static let cellHeightWidthRatio = CGFloat(190.0 / 320.0)
    let realm = Realm()
    var playlists: Results<Playlist>?

    override func viewDidLoad() {
        super.viewDidLoad()
        playlists = realm.objects(Playlist)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? TopTableViewCell ?? TopTableViewCell()
        let playlist = Playlist()
        playlist.title = "テストですーーー"
        playlist.playlister = "テストユーザー"
        playlist.comment = "テストしてみました！"
        var tracks = List<MusicTrack>()
        for i in 0...7 {
            let track = MusicTrack()
            track.title = "test song"
            track.artworkUrl = "http://vector-sozai.up.seesaa.net/image/HumanSkulls.png"
            track.artist = "test artist"
            tracks.append(track)
        }
        playlist.musisTracks = tracks

        cell.titleLabel.text = playlist.title
        cell.playlisterLabel.text = playlist.playlister
        cell.commentLabel.text = playlist.comment
        var artWorkURLs: [String] = []
        for (index, musicTrack) in enumerate(playlist.musisTracks) {
            if index > 5 { break }
            artWorkURLs.append(musicTrack.artworkUrl)
        }
        cell.playlistJacketImagesView.artWorkURLs = artWorkURLs
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TopViewController.cellHeightWidthRatio * UIScreen.mainScreen().bounds.width
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }



}
