import UIKit

class PlaylistMainCell: ISPTableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playlisterLabel: UILabel!
    private var gradientView = UIView()

    override func awakeFromNib() {
        let screenWidth = UIScreen.mainScreen().bounds.width
        gradientView.frame = CGRectMake(0, 0, screenWidth, screenWidth)
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.0).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).CGColor
        ]
        gradient.locations = [0.0, 0.25, 0.50, 1.0]
        gradientView.layer.insertSublayer(gradient, atIndex: 0)
        mainImageView.addSubview(gradientView)
        bringSubviewToFront(gradientView)
    }
}
