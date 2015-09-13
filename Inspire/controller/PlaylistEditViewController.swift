
import UIKit

class PlaylistEditViewController: ISPViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
        tableView.editing = true
    }

    @IBAction func closeButtonTouchUpInside(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
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

}
