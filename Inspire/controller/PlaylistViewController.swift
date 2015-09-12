import UIKit

class PlaylistViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource {

    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            default:
                return 7
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return UIScreen.mainScreen().bounds.width
            default:
                return 80.0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath) as? PlaylistMainCell ?? PlaylistMainCell()
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("MusicTrackCell", forIndexPath: indexPath) as? MusicTrackCell ?? MusicTrackCell()
                return cell
            default:
                return UITableViewCell()
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}
