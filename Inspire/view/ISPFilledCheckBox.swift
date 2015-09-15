import UIKit

class ISPFilledCheckBox: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        setBackgroundImage(UIImage(named: "Off"), forState: .Normal)
        setBackgroundImage(UIImage(named: "On"), forState: .Selected)
        addTarget(self, action: Selector("touchUpInside:"), forControlEvents: .TouchUpInside)
    }

    func touchUpInside(sender: ISPFilledCheckBox) {
        selected = !sender.selected
    }
}
