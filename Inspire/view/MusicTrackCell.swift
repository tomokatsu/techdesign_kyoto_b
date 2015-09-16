import UIKit
import SDWebImage

class MusicTrackCell: ISPTableViewCell {
    @IBOutlet weak private var thumbnailImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var artistLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak var playingImageView: UIImageView!
    private var _music: MusicTrack?
    var music: MusicTrack? {
        get {
            return _music
        }
        set(music) {
            _music = music
            thumbnailImageView.sd_setImageWithURL(NSURL(string: music?.artworkUrl ?? ""))
            titleLabel.text = music?.title
            artistLabel.text = music?.artist
            timeLabel.text = "0:29"
        }
    }
}
