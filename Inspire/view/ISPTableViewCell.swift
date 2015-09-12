import UIKit

class ISPTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutMargins = UIEdgeInsetsZero;
        preservesSuperviewLayoutMargins = false;
    }
}
