import UIKit
import SDWebImage

class AddFavoriteTrackCell: ISPTableViewCell {
    @IBOutlet weak private var thumbnailImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var artistLabel: UILabel!

    private var _music: MusicTrack?
    var music: MusicTrack? {
        get {
            return _music
        }
        set(music) {
            _music = music
            thumbnailImageView.sd_setImageWithURL(NSURL(string: _music?.artworkUrl ?? ""))
            titleLabel.text = _music?.title
            artistLabel.text = _music?.artist
        }
    }

}
