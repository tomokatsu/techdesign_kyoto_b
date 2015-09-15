import UIKit
import SDWebImage

class PlaylistInfoCell: ISPTableViewCell {

    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var inspireButton: UIButton!
    @IBOutlet weak private var userNameLabel: UILabel!

    private var _playlist: Playlist?
    var playlist: Playlist? {
        get {
            return _playlist
        }
        set(playlist) {
            _playlist = playlist
            userImageView.sd_setImageWithURL(NSURL(string: playlist!.userImageURL))
            userNameLabel.text = _playlist?.playlister
            if _playlist?.isInspire ?? false {
                inspireButton.hidden = true
            }
        }
    }

}
