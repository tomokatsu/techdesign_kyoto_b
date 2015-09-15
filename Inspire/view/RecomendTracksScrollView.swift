import UIKit
import RealmSwift

class RecomendTracksScrollView: UIScrollView {
    private var _musics: List<MusicTrack>?
    var recomendSongViewDelegate: RecomendSongViewDelegate?

    var musics: List<MusicTrack>? {
        get {
            return _musics
        }
        set(musics) {
            _musics = musics
            layoutIfNeeded()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        for subview in subviews {
            subview.removeFromSuperview()
        }
        contentSize = CGSizeMake(CGFloat(musics?.count ?? 0) * 140, 160)
        var x = CGFloat(30)
        for music in musics ?? List<MusicTrack>() {
            let recomendSongView = RecomendSongView.view()
            recomendSongView.music = music
            recomendSongView.delegate = recomendSongViewDelegate
            var frame = recomendSongView.frame
            frame.origin.x = x
            x += frame.size.width
            recomendSongView.frame = frame
            addSubview(recomendSongView)
        }
    }
}