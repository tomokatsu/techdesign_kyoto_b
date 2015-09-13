
import UIKit

class ISPNavigationBar: UINavigationBar {

    override func awakeFromNib() {
        titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Gill Sans", size: 18)!,
            NSForegroundColorAttributeName: UIColor.whiteColor(),
        ]
    }

    func show() {
        translucent = false
    }

    func hide() {
        setBackgroundImage(UIImage(), forBarMetrics: .Default)
        shadowImage = UIImage()
        translucent = true
    }

}
