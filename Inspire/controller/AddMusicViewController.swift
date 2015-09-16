import UIKit
import RealmSwift

class AddMusicViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource, AddFavoriteTrackCellDelegate, RecomendSongViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var playlist: Playlist?
    var recomendSongs: List<MusicTrack>?
    var favoriteSongs: Results<MusicTrack>?
    let realm = Realm()
    var checked: [Bool] = []
    private var additionalSongs = List<MusicTrack>()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 66
        var predicates: [NSPredicate] = []
        for mTrack in playlist!.musicTracks {
            predicates.append(NSPredicate(format: "trackId != \(mTrack.trackId)"))
        }
        favoriteSongs = realm.objects(MusicTrack).filter(NSCompoundPredicate.andPredicateWithSubpredicates(predicates))
        checked = Array(count: favoriteSongs?.count ?? 0, repeatedValue: false)

        for music in favoriteSongs! {
            recomendSongs?.append(music)
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "追加", style: .Plain, target: self, action: Selector("completeButtonTouchUpInside"))
        tableView.reloadData()
        navigationController!.interactivePopGestureRecognizer.enabled = false
    }

    override func viewWillDisappear(animated: Bool) {
        navigationController!.interactivePopGestureRecognizer.enabled = true
    }

    func checkBoxValueChangedOnCell(cell: AddFavoriteTrackCell) {
        checked[favoriteSongs!.indexOf(cell.music!)!] = cell.checkbox.checked
        if (cell.checkbox.checked) {
            additionalSongs.append(cell.music!)
        } else {
            for (i, music) in enumerate(additionalSongs) {
                if cell.music?.trackId ?? 0 == music.trackId {
                    additionalSongs.removeAtIndex(i)
                }
            }
        }
        tableView.reloadData()
    }

    func checkBoxValueChangedOnView(view: RecomendSongView) {
        if !view.checkbox.selected {
            additionalSongs.append(view.music!)
        } else {
            for (i, music) in enumerate(additionalSongs) {
                if view.music?.trackId ?? 0 == music.trackId {
                    additionalSongs.removeAtIndex(i)
                }
            }
        }
    }

    func completeButtonTouchUpInside() {
        for music in additionalSongs {
            playlist?.musicTracks.insert(music, atIndex: 0)
        }
        navigationController?.popViewControllerAnimated(true)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 40))
        let label = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - 30, 20))
        label.center = header.center
        label.font = UIFont(name: "mplus-1p-regular", size: 12)
        switch section {
            case 0:
                label.text = "このプレイリストによく追加されている曲"
            case 1:
                label.text = "FAVORITE TRACKS"
            default:
                label.text = ""
        }
        label.textColor = UIColor.whiteColor()
        header.addSubview(label)
        return header
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("Recomend", forIndexPath: indexPath) as! RecomendSongsCell
                cell.contentViewDelegate = self
                cell.recomendSongs = recomendSongs
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("Favorite", forIndexPath: indexPath) as! AddFavoriteTrackCell
                cell.music = favoriteSongs?[indexPath.row]
                cell.checkbox.checked = checked[indexPath.row]
                cell.delegate = self
                cell.contentView.layer.borderWidth = 0.3
                cell.contentView.layer.borderColor = UIColor(red: 71/255, green: 71/255, blue: 75/255, alpha: 1).CGColor
                return cell
            default:
                return UITableViewCell()
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 184
            case 1:
                return 80
            default:
                return 0
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                if recomendSongs?.count ?? 0 != 0 {
                    return 1
                } else {
                    return 0
                }
            case 1:
                return favoriteSongs?.count ?? 0
            default:
                return 0
        }
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

}
