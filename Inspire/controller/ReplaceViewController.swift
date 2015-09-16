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
    var recomendMusicTracks: List<MusicTrack>?
    var playlist: Playlist?

    private var isOpenRecomend = false

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
        if (!isOpenRecomend) && indexPath.section == 0 && indexPath.row == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("More", forIndexPath: indexPath) as? MoreTableViewCell ?? MoreTableViewCell()
            cell.titleLabel.text = "もっと見る"
            return cell
        }
        if isOpenRecomend && indexPath.section == 0 && (indexPath.row == 11 || indexPath.row == recomendMusicTracks!.count) {
            let cell = tableView.dequeueReusableCellWithIdentifier("More", forIndexPath: indexPath) as? MoreTableViewCell ?? MoreTableViewCell()
            cell.titleLabel.text = "閉じる"
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("ReplaceSongCell", forIndexPath: indexPath) as? ReplaceSongCell ?? ReplaceSongCell()
        cell.music = favoriteMusicTracks![indexPath.row]
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 40))
        header.backgroundColor = UIColor(red: 29/255, green: 29/255, blue: 32/255, alpha: 1)
        let titleLabel = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - CGFloat(60), 18))
        titleLabel.font = UIFont(name: "mplus-1p-regular", size: 12)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.center = header.center
        switch section {
            case 0:
                titleLabel.text = "RECOMENDED TRACKS"
            case 1:
                titleLabel.text = "FAVORITE TRACKS"
            default:
                titleLabel.text = ""
        }
        header.addSubview(titleLabel)
        return header
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (!isOpenRecomend && indexPath.section == 0 && indexPath.row == 4) ||
           (isOpenRecomend && indexPath.section == 0 && (indexPath.row == 11 || indexPath.row == recomendMusicTracks!.count)) {
            return 50
        }
        return 80
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recomendMusicTracks?.count ?? 0 < 4 && section == 0 {
            return recomendMusicTracks?.count ?? 0
        }

        switch section {
            case 0:
                if isOpenRecomend {
                    return recomendMusicTracks?.count ?? 0 > 10 ? 11 : recomendMusicTracks!.count + 1
                } else {
                    return 5
                }
            case 1:
                return favoriteMusicTracks?.count ?? 0
            default:
                return 0
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (!isOpenRecomend && indexPath.section == 0 && indexPath.row == 4) ||
           (isOpenRecomend && indexPath.section == 0 && (indexPath.row == 11 || indexPath.row == recomendMusicTracks!.count)) {
            dispatch_async(dispatch_get_main_queue()) {
                self.isOpenRecomend = !self.isOpenRecomend
                tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
            }
                return
        }

        let index = playlist?.musicTracks.indexOf(music!)
        playlist?.musicTracks.replace(index!, object: (tableView.cellForRowAtIndexPath(indexPath) as! ReplaceSongCell).music!)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
