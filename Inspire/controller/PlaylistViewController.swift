import UIKit
import RealmSwift

class PlaylistViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak private var tableView: UITableView!
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier: String = segue.identifier!
        switch identifier {
            case "DetailPlayer":
                let viewController = segue.destinationViewController as! DetailViewController
                viewController.playlist = playlist
                
            case "Inspire":
                let navigationController = segue.destinationViewController as! UINavigationController
                let copyPlaylist = Playlist()
                copyPlaylist.musicTracks = List<MusicTrack>()
                copyPlaylist.playlister = playlist!.playlister
                for music in playlist!.musicTracks {
                    copyPlaylist.musicTracks.append(music)
                }
                (navigationController.childViewControllers[0] as! PlaylistEditViewController).playlist = copyPlaylist

            default: break
        }
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
                return playlist?.musicTracks.count ?? 0
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
                cell.playlist = playlist
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("PlaylistInfoCell", forIndexPath: indexPath) as? PlaylistInfoCell ?? PlaylistInfoCell()
                cell.playlist = playlist
                return cell
            case 2:
                let cell = tableView.dequeueReusableCellWithIdentifier("MusicTrackCell", forIndexPath: indexPath) as? MusicTrackCell ?? MusicTrackCell()
                cell.music = playlist?.musicTracks[indexPath.row]
                return cell
            default:
                return UITableViewCell()
        }
    }
}
