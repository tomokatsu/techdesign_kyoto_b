import UIKit
import RealmSwift
import AVFoundation

class PlaylistViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak private var tableView: UITableView!
    var playlist: Playlist?

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "EndPlaying", object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if PlayerManager.sharedInstance.playlist == nil {
            PlayerManager.sharedInstance.setPlaylist(playlist!)
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("endPlaying"), name: "EndPlaying", object: nil)
    }

    func endPlaying() {
        tableView.reloadData()
    }

    override func viewWillDisappear(animated: Bool) {
        title = ""
    }

    override func viewWillAppear(animated: Bool) {
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
        tableView.reloadData()
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
                return 58
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
                cell.playingImageView.hidden = true
                if PlayerManager.sharedInstance.playlist == playlist {
                    if PlayerManager.sharedInstance.isPlaying() {
                        if PlayerManager.sharedInstance.toPlayIndex == indexPath.row {
                            cell.playingImageView.hidden = false
                        }
                    }
                }
                return cell
            default:
                return UITableViewCell()
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section != 2 { return }
        if playlist == PlayerManager.sharedInstance.playlist {
            if indexPath.row == PlayerManager.sharedInstance.toPlayIndex {
                if PlayerManager.sharedInstance.isPlaying() {
                    PlayerManager.sharedInstance.pause()
                } else {
                    PlayerManager.sharedInstance.play()
                }
            } else {
                PlayerManager.sharedInstance.reset()
                PlayerManager.sharedInstance.pause()
                PlayerManager.sharedInstance.toPlayIndex = indexPath.row
                PlayerManager.sharedInstance.play()
            }
        } else {
            PlayerManager.sharedInstance.reset()
            PlayerManager.sharedInstance.pause()
            PlayerManager.sharedInstance.setPlaylist(playlist!)
            PlayerManager.sharedInstance.toPlayIndex = indexPath.row
            PlayerManager.sharedInstance.play()
        }
        tableView.reloadData()
    }
}
