
import UIKit

class ISPNavigationBar: UINavigationBar {

    override func awakeFromNib() {
        tintColor = UIColor.whiteColor()
        barStyle = UIBarStyle.BlackTranslucent
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
