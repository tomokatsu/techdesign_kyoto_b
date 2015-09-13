
import UIKit

class ISPNavigationBar: UINavigationBar {

    override func awakeFromNib() {
        titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Gill Sans", size: 18)!,
            NSForegroundColorAttributeName: UIColor.whiteColor(),
        ]
        barTintColor = UIColor(red: 0.11372549, green: 0.11372549, blue: 0.125490196, alpha: 1)
        tintColor = UIColor.whiteColor()
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
