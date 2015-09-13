
import UIKit

class PlaylistEditViewController: ISPViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

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
        return tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as! EditTableViewHeader
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovableTrackCell", forIndexPath: indexPath) as? MovableTrackCell ?? MovableTrackCell()
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
