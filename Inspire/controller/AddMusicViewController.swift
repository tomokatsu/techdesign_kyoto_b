import UIKit
import RealmSwift

class AddMusicViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource, AddFavoriteTrackCellDelegate, RecomendSongViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var recomendSongs: List<MusicTrack>?
    var favoriteSongs: Results<MusicTrack>?
    let realm = Realm()
    var checked: [Bool] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 30
        var predicates: [NSPredicate] = []
        var playlists = realm.objects(Playlist)

        for playlist in playlists{
            for mTrack in playlist.musicTracks{
                predicates.append(NSPredicate(format: "trackId != \(mTrack.trackId)"))
            }
        }
        favoriteSongs = realm.objects(MusicTrack).filter(NSCompoundPredicate.andPredicateWithSubpredicates(predicates))
        checked = Array(count: favoriteSongs?.count ?? 0, repeatedValue: false)

        for music in favoriteSongs! {
            recomendSongs?.append(music)
        }

        tableView.reloadData()
    }

    func checkBoxValueChangedOnCell(cell: AddFavoriteTrackCell) {
        checked[favoriteSongs!.indexOf(cell.music!)!] = cell.checkbox.checked
        tableView.reloadData()
    }

    func checkBoxValueChangedOnView(view: RecomendSongView) {
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "このプレイリストによく追加されている曲"
            case 1:
                return "Favorite Tracks"
            default:
                return ""
        }
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
                return cell
            default:
                return UITableViewCell()
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 162
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

}
