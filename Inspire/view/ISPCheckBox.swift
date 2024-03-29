import UIKit

class ISPClearCheckBox: UIButton {
    private var _checked: Bool = false
    var checked: Bool {
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
        setBackgroundImage(UIImage(named: "Off_clear"), forState: .Normal)
        setBackgroundImage(UIImage(named: "On"), forState: .Selected)
    }

    func touchUpInside(sender: ISPClearCheckBox) {
        checked = !sender.selected
    }
}
