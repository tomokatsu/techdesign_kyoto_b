import UIKit

class EditAddMusicHeader: UITableViewHeaderFooterView {
    var delegate: EditAddMusicHeaderDelegate?

    override func awakeFromNib() {
        let gestureRec = UITapGestureRecognizer(target: self, action: Selector("didTapOnView:"))
        self.addGestureRecognizer(gestureRec)
    }

    func didTapOnView(sender: AnyObject) {
        if self.delegate?.respondsToSelector("touchUpInside:") ?? false {
            self.delegate!.touchUpInside(self)
        }
    }
}

protocol EditAddMusicHeaderDelegate: NSObjectProtocol {
    func touchUpInside(view: EditAddMusicHeader)
}
