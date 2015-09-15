import UIKit
import SDWebImage

class AddFavoriteTrackCell: ISPTableViewCell {
    @IBOutlet weak private var thumbnailImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var artistLabel: UILabel!
    @IBOutlet weak var checkbox: ISPClearCheckBox!
    var delegate: AddFavoriteTrackCellDelegate?

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

    @IBAction func checkBoxChangeValue(sender: ISPClearCheckBox) {
        checkbox.touchUpInside(sender)
        if delegate?.respondsToSelector(Selector("checkBoxValueChangedOnCell:")) ?? false {
            delegate?.checkBoxValueChangedOnCell(self)
        }
    }


}

protocol AddFavoriteTrackCellDelegate: NSObjectProtocol {
    func checkBoxValueChangedOnCell(cell: AddFavoriteTrackCell)
}