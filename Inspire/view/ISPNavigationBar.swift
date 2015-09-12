
import UIKit

class ISPNavigationBar: UINavigationBar {

    func show() {
        translucent = false
    }

    func hide() {
        setBackgroundImage(UIImage(), forBarMetrics: .Default)
        shadowImage = UIImage()
        translucent = true
    }

}
