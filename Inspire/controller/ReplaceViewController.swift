import UIKit
import RealmSwift

class ReplaceViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak private var blurImageView: UIImageView!
    @IBOutlet weak private var thumbnailImageView: UIImageView!
    @IBOutlet weak private var replacedSongTitleLabel: UILabel!
    @IBOutlet weak private var replacedSongArtistLabel: UILabel!
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
    let realm = Realm()
    var favoriteMusicTracks: Results<MusicTrack>?

    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteMusicTracks = realm.objects(MusicTrack)
        layoutView()
    }

    func layoutView() {
        blurView.frame = UIScreen.mainScreen().bounds
        blurImageView.addSubview(blurView)
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
        self.navigationController?.popViewControllerAnimated(true)
    }

}
