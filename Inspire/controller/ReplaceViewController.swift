import UIKit
import RealmSwift
import SDWebImage

class ReplaceViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak private var blurImageView: UIImageView!
    @IBOutlet weak private var thumbnailImageView: UIImageView!
    @IBOutlet weak private var replacedSongTitleLabel: UILabel!
    @IBOutlet weak private var replacedSongArtistLabel: UILabel!
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
    let realm = Realm()
    var favoriteMusicTracks: Results<MusicTrack>?
    var playlist: Playlist?

    var music: MusicTrack?


    override func viewDidLoad() {
        super.viewDidLoad()

        var predicates: [NSPredicate] = []
        var playlists = realm.objects(Playlist)

        for music in playlist!.musicTracks {
                predicates.append(NSPredicate(format: "trackId != \(music.trackId)"))
        }
        favoriteMusicTracks = realm.objects(MusicTrack).filter(NSCompoundPredicate.andPredicateWithSubpredicates(predicates))
        layoutView()
    }

    func layoutView() {
        blurView.frame = UIScreen.mainScreen().bounds
        blurImageView.addSubview(blurView)
        blurImageView.sd_setImageWithURL(NSURL(string: music?.artworkUrl ?? ""))
        thumbnailImageView.sd_setImageWithURL(NSURL(string: music?.artworkUrl ?? ""))
        replacedSongTitleLabel.text = music?.title
        replacedSongArtistLabel.text = music?.artist
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReplaceSongCell", forIndexPath: indexPath) as? ReplaceSongCell ?? ReplaceSongCell()
        cell.music = favoriteMusicTracks![indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMusicTracks!.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = playlist?.musicTracks.indexOf(music!)
        playlist?.musicTracks.replace(index!, object: (tableView.cellForRowAtIndexPath(indexPath) as! ReplaceSongCell).music!)
        self.navigationController?.popViewControllerAnimated(true)
    }

}
