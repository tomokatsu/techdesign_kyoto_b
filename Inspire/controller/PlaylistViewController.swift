import UIKit

class PlaylistViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
        tableView.contentInset = UIEdgeInsetsZero
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return 7
            default:
                return 0
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UIScreen.mainScreen().bounds.width
        case 1:
            return 66
        case 2:
            return 80
        default:
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath) as? PlaylistMainCell ?? PlaylistMainCell()
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("PlaylistInfoCell", forIndexPath: indexPath) as? PlaylistInfoCell ?? PlaylistInfoCell()
                return cell
            case 2:
                let cell = tableView.dequeueReusableCellWithIdentifier("MusicTrackCell", forIndexPath: indexPath) as? MusicTrackCell ?? MusicTrackCell()
                return cell
            default:
                return UITableViewCell()
        }
    }
}
