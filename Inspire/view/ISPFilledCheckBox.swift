import UIKit

class ISPFilledCheckBox: UIButton {
    private var _checked: Bool = false
    private(set) var checked: Bool {
        get {
            return _checked
        }
        set(checked) {
            _checked = checked
            selected = checked
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setBackgroundImage(UIImage(named: "Off"), forState: .Normal)
        setBackgroundImage(UIImage(named: "On"), forState: .Selected)
        addTarget(self, action: Selector("touchUpInside:"), forControlEvents: .TouchUpInside)
    }

    func touchUpInside(sender: ISPFilledCheckBox) {
        checked = !sender.selected
        print(checked)
    }
}
