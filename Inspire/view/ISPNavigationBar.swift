
import UIKit

class ISPNavigationBar: UINavigationBar {

    override func awakeFromNib() {
        tintColor = UIColor.whiteColor()
        barStyle = UIBarStyle.BlackTranslucent
        layer.borderColor = UIColor(red: 45/255, green: 45/255, blue: 50/255, alpha: 1).CGColor
        layer.borderWidth = 2
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
