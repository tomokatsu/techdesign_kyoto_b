import UIKit
import SDWebImage

class MusicTrackCell: ISPTableViewCell {
    @IBOutlet weak private var thumbnailImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var artistLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!

    var music: MusicTrack? {
        get {
            return self.music
        }
        set(music) {
            self.music = music
            layoutIfNeeded()
        }
    }

    override func layoutSubviews() {
        thumbnailImageView.sd_setImageWithURL(NSURL(string: music?.artworkUrl ?? ""))
        titleLabel.text = music?.title
        artistLabel.text = music?.artist
        timeLabel.text = "29"
    }
}
