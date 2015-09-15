import UIKit

class ISPCheckBox: UIButton {
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
        addTarget(self, action: Selector("touchUpInside:"), forControlEvents: .TouchUpInside)
    }

    func touchUpInside(sender: ISPCheckBox) {
        checked = !sender.selected
        print(checked)
    }
}
