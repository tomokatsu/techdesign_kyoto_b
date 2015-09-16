import UIKit
import RealmSwift

class PublishViewController: ISPViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
    let realm = Realm()
    var playlist: Playlist?

    override func viewDidLoad() {
        layoutViews()
    }

    func layoutViews() {
        blurView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 441)
        backgroundImageView.addSubview(blurView)
        backgroundImageView.sd_setImageWithURL(NSURL(string: playlist!.musicTracks.first?.artworkUrl ?? ""))
        firstImageView.sd_setImageWithURL(NSURL(string: playlist!.musicTracks.first?.artworkUrl ?? ""))
        secondImageView.sd_setImageWithURL(NSURL(string: playlist!.musicTracks[1].artworkUrl ?? ""))
        thirdImageView.sd_setImageWithURL(NSURL(string: playlist!.musicTracks[2].artworkUrl ?? ""))
        titleLabel.text = "\(playlist!.title) inspired by \(playlist!.playlister)"
        commentLabel.text = playlist?.comment ?? ""
        moodLabel.text = "MOOD: \(playlist!.mood)"
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 40))
        header.backgroundColor = UIColor(red: 29/255, green: 29/255, blue: 32/255, alpha: 1)
        let titleLabel = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - 32, 18))
        titleLabel.center = header.center
        titleLabel.font = UIFont(name: "mplus-1p-regular", size: 12)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.text = "TRACKS"
        header.addSubview(titleLabel)
        return header
    }

    @IBAction func publishButtonTouchUpInside(sender: UIBarButtonItem) {
        playlist?.playlister = "TAKESHI"
        playlist?.userImageURL = "http://affexceed.art.coocan.jp/water/unit_01/data/aff_data009.jpg"
        playlist?.isInspire = true
        realm.write {
            self.realm.add(self.playlist!, update: false)
        }
        let publishedViewController: PublishedViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Published") as! PublishedViewController
        publishedViewController.modalPresentationStyle = .OverFullScreen
        publishedViewController.modalTransitionStyle = .CrossDissolve
        presentViewController(publishedViewController, animated: true, completion:nil)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MusicTrackCell", forIndexPath: indexPath) as? MusicTrackCell ?? MusicTrackCell()
        cell.music = playlist?.musicTracks[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.musicTracks.count ?? 0
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}
