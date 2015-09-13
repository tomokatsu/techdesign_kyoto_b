
import UIKit

class EditTableViewHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))

    override func awakeFromNib() {
        var fixedFrame = frame
        fixedFrame.size.height = UIScreen.mainScreen().bounds.width
        fixedFrame.size.width = UIScreen.mainScreen().bounds.width
        frame = fixedFrame
        blurView.frame = fixedFrame
        blurImageView.addSubview(blurView)
        bringSubviewToFront(mainImageView)
    }
}
