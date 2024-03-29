import UIKit
import SDWebImage

class PlaylistMainCell: ISPTableViewCell {
    @IBOutlet weak private var mainImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var inspiredNumberLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!

    private var gradientView = UIView()
    private var _playlist: Playlist?
    var playlist: Playlist? {
        get {
            return _playlist
        }
        set(playlist) {
            _playlist = playlist
            mainImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[0].artworkUrl ?? ""))
            titleLabel.text = playlist?.title
            inspiredNumberLabel.text = "Inspired \(playlist!.inspiredNumber)"
            contentView.bringSubviewToFront(titleLabel)
            contentView.bringSubviewToFront(inspiredNumberLabel)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        let screenWidth = UIScreen.mainScreen().bounds.width
        gradientView.frame = CGRectMake(0, 0, screenWidth, screenWidth)
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.0).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).CGColor
        ]
        gradient.locations = [0.0, 0.25, 0.50, 1.0]
        gradientView.layer.insertSublayer(gradient, atIndex: 0)
        mainImageView.addSubview(gradientView)
        bringSubviewToFront(gradientView)
    }
}
