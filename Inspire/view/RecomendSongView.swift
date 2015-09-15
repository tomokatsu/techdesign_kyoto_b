import UIKit
import SDWebImage

class RecomendSongView: UIView {
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var artistLabel: UILabel!
    var delegate: RecomendSongViewDelegate?
    private var _music: MusicTrack?
    var music: MusicTrack? {
        get {
            return _music
        }
        set(music) {
            _music = music
            SDWebImageManager.sharedManager().downloadImageWithURL(NSURL(string: _music?.artworkUrl ?? ""), options: nil
                , progress: { (a: Int, b:Int) -> Void in
                }, completed: { (image: UIImage!, b: NSError!, c: SDImageCacheType, d: Bool, e:NSURL!) -> Void in
                    self.imageView.image = RecomendSongView.nonCompressImage(image)
            })
            titleLabel.text = _music?.title
            artistLabel.text = _music?.artist
        }
    }

    static func view() -> RecomendSongView {
        return UINib(nibName: "RecomendTrackView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! RecomendSongView
    }

    @IBAction func checkBoxValueChanged(sender: ISPFilledCheckBox) {
        if delegate?.respondsToSelector(Selector("checkBoxValueChangedOnView:")) ?? false {
            delegate?.checkBoxValueChangedOnView(self)
        }
    }

    static func nonCompressImage(image: UIImage) -> UIImage {
        var retImage = image
        UIGraphicsBeginImageContext(CGSizeMake(retImage.size.width, retImage.size.height))
        retImage.drawAtPoint(CGPointMake(0,0))
        retImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return retImage
    }

}

protocol RecomendSongViewDelegate: NSObjectProtocol {
    func checkBoxValueChangedOnView(view: RecomendSongView)
}
