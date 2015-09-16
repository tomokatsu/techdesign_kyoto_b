
import UIKit

class PublishViewController: ISPViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))

    var playlist: Playlist?

    override func viewDidLoad() {
        layoutViews()
    }

    func layoutViews() {
        blurView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 425)
        backgroundImageView.addSubview(blurView)
        backgroundImageView.sd_setImageWithURL(NSURL(string: playlist!.musicTracks.first?.artworkUrl ?? ""))
        firstImageView.sd_setImageWithURL(NSURL(string: playlist!.musicTracks.first?.artworkUrl ?? ""))
        secondImageView.sd_setImageWithURL(NSURL(string: playlist!.musicTracks[1].artworkUrl ?? ""))
        thirdImageView.sd_setImageWithURL(NSURL(string: playlist!.musicTracks[2].artworkUrl ?? ""))

    }

    @IBAction func publishButtonTouchUpInside(sender: UIBarButtonItem) {
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
