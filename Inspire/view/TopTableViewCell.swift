import UIKit
import SDWebImage

class TopTableViewCell: UITableViewCell {
    @IBOutlet weak private var commentLabel: UILabel!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var playlisterLabel: UILabel!
    @IBOutlet weak private var playlistJacketImagesView: PlaylistJacketImagesView!
    @IBOutlet weak private var userImageView: UIImageView!
    private var _playlist: Playlist?

    var playlist: Playlist? {
        get {
            return _playlist
        }
        set(playlist) {
            _playlist = playlist
            layoutIfNeeded()
        }
    }

    override func layoutSubviews() {
        titleLabel.text = playlist?.title
        commentLabel.text = playlist?.comment
        playlisterLabel.text = playlist?.playlister
        userImageView.sd_setImageWithURL(NSURL(string: playlist!.userImageURL))
        var artWorkURLs: [String] = []
        for track in playlist!.musicTracks {
            artWorkURLs.append(track.artworkUrl)
        }
        playlistJacketImagesView.artWorkURLs = artWorkURLs

        playlistJacketImagesView.bringSubviewToFront(titleLabel)
        playlistJacketImagesView.bringSubviewToFront(playlisterLabel)
        playlistJacketImagesView.bringSubviewToFront(userImageView)
    }

}
