import UIKit
import SDWebImage

class PlaylistEditViewController: ISPViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak private var tableView: UITableView!

    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
        tableView.editing = true
        tableView.registerNib(UINib(nibName: "EditTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.allowsSelectionDuringEditing = true
        title = ""
    }

    @IBAction func closeButtonTouchUpInside(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.mainScreen().bounds.width
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as! EditTableViewHeader
        headerView.blurImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[0].artworkUrl ?? ""))
        headerView.mainImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[0].artworkUrl ?? ""))
        return headerView
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.musicTracks.count ?? 0
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovableTrackCell", forIndexPath: indexPath) as? MovableTrackCell ?? MovableTrackCell()
        cell.music = playlist?.musicTracks[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
    }

    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }

    func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

}
