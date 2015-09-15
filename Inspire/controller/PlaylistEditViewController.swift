import UIKit
import SDWebImage

class PlaylistEditViewController: ISPViewController, UITableViewDataSource, UITableViewDelegate, EditTableViewHeaderDelegate, EditAddMusicHeaderDelegate {

    @IBOutlet weak private var tableView: UITableView!
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
        tableView.editing = true
        tableView.registerNib(UINib(nibName: "EditTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.registerNib(UINib(nibName: "EditAddMusicHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "Add")
        tableView.allowsSelectionDuringEditing = true
        title = ""
    }

    @IBAction func closeButtonTouchUpInside(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func touchUpInside(view: EditAddMusicHeader) {
        let addMusicViewController = storyboard?.instantiateViewControllerWithIdentifier("AddMusic") as! AddMusicViewController
        self.navigationController?.pushViewController(addMusicViewController, animated: true)
        addMusicViewController.recomendSongs = playlist?.additionalTracks
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

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
            case 0:
                return 397
            case 1:
                return 40
            default:
                return 0
        }
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
            case 0:
                let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as! EditTableViewHeader
                headerView.playlist = playlist
                headerView.delegate = self
                return headerView
            case 1:
                let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Add") as! EditAddMusicHeader
                headerView.delegate = self
                return headerView
            default:
                return UIView()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
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
        let tmp = playlist?.musicTracks[sourceIndexPath.row]
        playlist?.musicTracks.removeAtIndex(sourceIndexPath.row)
        playlist?.musicTracks.insert(tmp!, atIndex: destinationIndexPath.row)
        tableView.reloadData()
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
