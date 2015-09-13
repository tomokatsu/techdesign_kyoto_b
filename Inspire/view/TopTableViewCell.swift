import UIKit

class TopTableViewCell: UITableViewCell {
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playlisterLabel: UILabel!
    @IBOutlet weak var playlistJacketImagesView: PlaylistJacketImagesView!
    @IBOutlet weak var userImageView: UIImageView!

    override func layoutSubviews() {
        playlistJacketImagesView.bringSubviewToFront(titleLabel)
        playlistJacketImagesView.bringSubviewToFront(playlisterLabel)
        playlistJacketImagesView.bringSubviewToFront(userImageView)
    }

}
