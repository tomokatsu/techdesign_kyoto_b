import UIKit
import RealmSwift
import AVFoundation
import CoreMedia

class DetailViewController:ISPViewController{

    @IBOutlet weak private var artwork: UIImageView!
    @IBOutlet weak private var trackTime: UILabel!
    @IBOutlet weak private var playTime: UILabel!
    @IBOutlet weak private var trackTitle: UILabel!
    @IBOutlet weak private var artist: UILabel!
    @IBOutlet weak var playTimeSlider: UISlider!

    var playingTimeTimer : NSTimer?
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        PlayerManager.sharedInstance.setPlaylist(playlist!)
        self.updatePlayingInfo()
    }

    @IBAction func playAndPauseButtonTouchUpInside(sender: UIButton) {
        if PlayerManager.sharedInstance.isPlaying() {
            PlayerManager.sharedInstance.pause()
        }else{
            PlayerManager.sharedInstance.play()
        }
    }

    @IBAction func nextButtonTouchUpInside(sender: UIButton) {
        PlayerManager.sharedInstance.playNextSong()
    }

    @IBAction func backButtonTouchUpInside(sender: UIButton) {
        PlayerManager.sharedInstance.playPrevSong()
    }

    @IBAction func playTimeSliderAction(sender: AnyObject) {
        PlayerManager.sharedInstance.setProgress(self.playTimeSlider.value)
    }

    func setupView(){
        self.playTimeSlider.maximumValue = 1.0

        playingTimeTimer = NSTimer.scheduledTimerWithTimeInterval(
            1,
            target: self,
            selector: "updatePlayingInfo",
            userInfo: nil,
            repeats: true
        )
    }

    func updatePlayingInfo() {
        self.trackTime.text = PlayerManager.sharedInstance.playTime() ?? "00:00"
        self.playTime.text = PlayerManager.sharedInstance.playingTime() ?? "00:00"
        self.playTimeSlider.value = PlayerManager.sharedInstance.getProgress() ?? Float(0.0)

        self.trackTitle.text = PlayerManager.sharedInstance.title() ?? "TITLE"
        self.artist.text = PlayerManager.sharedInstance.artist() ?? "ARTIST"
        self.artwork.sd_setImageWithURL(PlayerManager.sharedInstance.artworkUrl())
    }
}
