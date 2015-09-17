import UIKit
import SDWebImage

class PlaylistEditViewController: ISPViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, EditTableViewHeaderDelegate, EditAddMusicHeaderDelegate {

    @IBOutlet weak private var tableView: UITableView!
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
        navigationItem.rightBarButtonItem?.enabled = false
        tableView.editing = true
        tableView.registerNib(UINib(nibName: "EditTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.registerNib(UINib(nibName: "EditAddMusicHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "Add")
        tableView.allowsSelectionDuringEditing = true
        title = ""
    }

    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
            case "Publish":
                let publishViewController = segue.destinationViewController as! PublishViewController
                publishViewController.playlist = playlist
            case "Replace":
                let replaceViewController = segue.destinationViewController as! ReplaceViewController
                replaceViewController.playlist = playlist
                replaceViewController.music = playlist?.musicTracks[tableView.indexPathForCell(sender as! UITableViewCell)!.row]
            default:
                return
        }
    }

    @IBAction func closeButtonTouchUpInside(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func touchUpInside(view: EditAddMusicHeader) {
        let addMusicViewController = storyboard?.instantiateViewControllerWithIdentifier("AddMusic") as! AddMusicViewController
        self.navigationController?.pushViewController(addMusicViewController, animated: true)
        addMusicViewController.recomendSongs = playlist?.additionalTracks
        addMusicViewController.playlist = playlist
    }

    func moodSelectButtonTouchUpInsideOnView(view: EditTableViewHeader) {
        let alertController = DOAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alertController.alertViewBgColor = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)
        alertController.buttonFont[.Default] = UIFont(name: "mplus-1p-light", size: 12.0)
        alertController.buttonTextColor[.Default] = UIColor.whiteColor()
        alertController.buttonBgColor[.Default] = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)
        alertController.buttonBgColorHighlighted[.Default] = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)
        view.titleTextField.resignFirstResponder()
        view.commentTextField.resignFirstResponder()
        alertController.addAction(DOAlertAction(title: "NONE", style: .Default) { action in
            view.moodSelectButton.setTitle("NONE", forState: .Normal)
            self.playlist?.mood = "NONE"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
            })
        alertController.addAction(DOAlertAction(title: "HAPPY", style: .Default) { action in
            view.moodSelectButton.setTitle("HAPPY", forState: .Normal)
            self.playlist?.mood = "HAPY"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "EXCITED", style: .Default) { action in
            view.moodSelectButton.setTitle("EXCITED", forState: .Normal)
            self.playlist?.mood = "EXCITED"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "RELAX", style: .Default) { action in
            view.moodSelectButton.setTitle("RELAX", forState: .Normal)
            self.playlist?.mood = "RELAX"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "LOVE", style: .Default) { action in
            view.moodSelectButton.setTitle("LOVE", forState: .Normal)
            self.playlist?.mood = "LOVE"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "SAD", style: .Default) { action in
            view.moodSelectButton.setTitle("SAD", forState: .Normal)
            self.playlist?.mood = "SAD"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "DARK", style: .Default) { action in
            view.moodSelectButton.setTitle("DARK", forState: .Normal)
            self.playlist?.mood = "DARK"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "MORNING", style: .Default) { action in
            view.moodSelectButton.setTitle("MORNING", forState: .Normal)
            self.playlist?.mood = "MORNING"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "SLEEP", style: .Default) { action in
            view.moodSelectButton.setTitle("SLEEP", forState: .Normal)
            self.playlist?.mood = "SLEEP"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "STUDY", style: .Default) { action in
            view.moodSelectButton.setTitle("STUDY", forState: .Normal)
            self.playlist?.mood = "STUDY"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "WORKOUT", style: .Default) { action in
            view.moodSelectButton.setTitle("WORKOUT", forState: .Normal)
            self.playlist?.mood = "WORKOUT"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "PARTY", style: .Default) { action in
            view.moodSelectButton.setTitle("PARTY", forState: .Normal)
            self.playlist?.mood = "PARTY"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "DRIVE", style: .Default) { action in
            view.moodSelectButton.setTitle("DRIVE", forState: .Normal)
            self.playlist?.mood = "DRIVE"
            view.moodSelectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            view.pulldownImageView.hidden = true
        })
        alertController.addAction(DOAlertAction(title: "Cancel", style: .Default) { action in
        })
        presentViewController(alertController, animated: true, completion: nil)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            let separatorView = UIView(frame: CGRectMake(0, alertController.buttonAreaScrollView.frame.height + 220, UIScreen.mainScreen().bounds.width, 0.3))
            separatorView.backgroundColor = UIColor(red: 71/255, green: 71/255, blue: 75/255, alpha: 1)
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
                return 461
            case 1:
                return 40
            default:
                return 0
        }
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
            case 0:
                let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as! EditTableViewHeader
                headerView.playlist = playlist
                headerView.delegate = self
                headerView.titleTextField.delegate = self
                headerView.titleTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
                headerView.commentTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
                headerView.titleTextField.tag = 1
                headerView.commentTextField.delegate = self
                headerView.commentTextField.tag = 2
                headerView.titleTextField.text = playlist?.title
                headerView.commentTextField.text = playlist?.comment
                if playlist!.mood != "" {
                    headerView.moodSelectButton.setTitle(playlist!.mood, forState: .Normal)
                    headerView.pulldownImageView.hidden = true
                }
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
        if indexPath.section == 0 {
            return 0
        }
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

    func textFieldDidChange(textField: UITextField) {
        if textField.tag == 2 {
            playlist?.comment = textField.text
            print(1)
            return
        }

        if textField.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 0 {
            navigationItem.rightBarButtonItem?.enabled = false
        } else {
            playlist?.title = textField.text
            navigationItem.rightBarButtonItem?.enabled = true
        }
        return
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
