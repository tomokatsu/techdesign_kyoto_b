import UIKit
import SDWebImage

class EditTableViewHeader: UITableViewHeaderFooterView, UITextFieldDelegate {
    @IBOutlet weak private var blurImageView: UIImageView!
    @IBOutlet weak private var mainImageView: UIImageView!
    @IBOutlet weak private var secondImageView: UIImageView!
    @IBOutlet weak private var thirdImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var pulldownImageView: UIImageView!
    @IBOutlet weak var moodSelectButton: UIButton!
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
    var delegate: EditTableViewHeaderDelegate?
    private var _playlist: Playlist?
    var playlist: Playlist? {
        get {
            return _playlist
        }
        set(playlist) {
            _playlist = playlist
            blurImageView.sd_setImageWithURL(NSURL(string: _playlist?.musicTracks[0].artworkUrl ?? ""))
            mainImageView.sd_setImageWithURL(NSURL(string: _playlist?.musicTracks[0].artworkUrl ?? ""))
            secondImageView.sd_setImageWithURL(NSURL(string: _playlist?.musicTracks[1].artworkUrl ?? ""))
            thirdImageView.sd_setImageWithURL(NSURL(string: _playlist?.musicTracks[2].artworkUrl ?? ""))
        }
    }

    override func awakeFromNib() {
        var fixedFrame = frame
        fixedFrame.size.height = self.frame.height
        fixedFrame.size.width = UIScreen.mainScreen().bounds.width
        frame = fixedFrame
        blurView.frame = fixedFrame
        blurImageView.addSubview(blurView)

        titleTextField.attributedPlaceholder = NSAttributedString(string:"タイトル(必須)", attributes:[NSForegroundColorAttributeName: UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 0.7)])
        commentTextField.attributedPlaceholder = NSAttributedString(string:"プレイリストの説明", attributes:[NSForegroundColorAttributeName: UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 0.7)])
        titleTextField.delegate = self
        commentTextField.delegate = self
        bringSubviewToFront(thirdImageView)
        bringSubviewToFront(secondImageView)
        bringSubviewToFront(mainImageView)
        sendSubviewToBack(blurImageView)

    }

    @IBAction func moodSelectButtonTouchUpInside(sender: AnyObject) {
        if (self.delegate?.respondsToSelector(Selector("moodSelectButtonTouchUpInsideOnView:")) ?? false) {
            self.delegate?.moodSelectButtonTouchUpInsideOnView(self)
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

protocol EditTableViewHeaderDelegate: NSObjectProtocol {
    func moodSelectButtonTouchUpInsideOnView(view: EditTableViewHeader)
}