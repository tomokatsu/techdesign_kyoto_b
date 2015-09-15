import UIKit
import SDWebImage

class PlaylistEditViewController: ISPViewController, UITableViewDataSource, UITableViewDelegate, EditTableViewHeaderDelegate {

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

    func moodSelectButtonTouchUpInsideOnView(view: EditTableViewHeader) {
        let alertController = DOAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alertController.alertViewBgColor = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)
        alertController.buttonFont[.Default] = UIFont(name: "mplus-1p-light", size: 12.0)
        alertController.buttonTextColor[.Default] = UIColor.whiteColor()
        alertController.buttonBgColor[.Default] = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)
        alertController.buttonBgColorHighlighted[.Default] = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)

        alertController.addAction(DOAlertAction(title: "Happy", style: .Default) { action in

        })
        alertController.addAction(DOAlertAction(title: "Excited", style: .Default) { action in

        })
        alertController.addAction(DOAlertAction(title: "Relax", style: .Default) { action in

        })
        alertController.addAction(DOAlertAction(title: "Love", style: .Default) { action in

        })

        alertController.addAction(DOAlertAction(title: "Cancel", style: .Default) { action in

        })

        presentViewController(alertController, animated: true, completion: {

        })
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            let separatorView = UIView(frame: CGRectMake(0, alertController.buttonAreaScrollView.frame.height - 55, UIScreen.mainScreen().bounds.width, 0.5))
            separatorView.backgroundColor = UIColor.whiteColor()
            alertController.buttonAreaScrollView.addSubview(separatorView)
            alertController.buttonAreaScrollView.bringSubviewToFront(separatorView)
        }
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.mainScreen().bounds.width
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as! EditTableViewHeader
        headerView.playlist = playlist
        headerView.delegate = self
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
