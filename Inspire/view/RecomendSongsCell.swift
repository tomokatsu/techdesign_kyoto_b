import UIKit
import RealmSwift

class RecomendSongsCell: ISPTableViewCell {

    @IBOutlet weak private var scrollView: RecomendTracksScrollView!
    private var _contentViewDelegate: RecomendSongViewDelegate?
    var contentViewDelegate: RecomendSongViewDelegate? {
        get {
            return _contentViewDelegate
        }
        set(delegate) {
            _contentViewDelegate = delegate
            scrollView.recomendSongViewDelegate = _contentViewDelegate
        }
    }

    private var _recomendSongs: List<MusicTrack>?
    var recomendSongs: List<MusicTrack>? {
        get {
            return _recomendSongs
        }
        set(recomendSongs) {
            _recomendSongs = recomendSongs
            scrollView.musics = _recomendSongs
        }
    }
}
