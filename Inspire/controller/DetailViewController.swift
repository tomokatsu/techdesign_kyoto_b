import UIKit
import RealmSwift
import AVFoundation
import CoreMedia

class DetailViewController:ISPViewController{

    @IBOutlet weak var artwork: UIImageView!
    @IBOutlet weak var trackTime: UILabel!
    @IBOutlet weak var playTime: UILabel!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var playTimeSlider: UISlider!

    var pManager: PlayerManager?
    var playingTimeTimer : NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.pManager = PlayerManager(playlist: playList)
        self.setupView()
    }

    @IBAction func playAndPauseButtonTouchUpInside(sender: UIButton) {
        if pManager!.isPlaying() {
            pManager?.pause()
        }else{
            pManager?.play()
        }
    }

    @IBAction func nextButtonTouchUpInside(sender: UIButton) {
        pManager?.playNextSong()
    }

    @IBAction func backButtonTouchUpInside(sender: UIButton) {
        pManager?.playPrevSong()
    }

    @IBAction func playTimeSliderAction(sender: AnyObject) {
        pManager?.setProgress(self.playTimeSlider.value)
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
        self.trackTime.text = pManager?.playTime() ?? "00:00"
        self.playTime.text = pManager?.playingTime() ?? "00:00"

        self.playTimeSlider.value = pManager?.getProgress() ?? Float(0.0)

        self.trackTitle.text = pManager?.title() ?? "TITLE"
        self.artist.text = pManager?.artist() ?? "ARTIST"
    }
}
