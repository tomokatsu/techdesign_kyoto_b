import UIKit
import RealmSwift
import AVFoundation
import CoreMedia

class DetailViewController: ISPViewController {

    @IBOutlet weak private var blurImageView: UIImageView!
    @IBOutlet weak private var secondImageView: UIImageView!
    @IBOutlet weak private var thirdImageView: UIImageView!
    @IBOutlet weak private var firstImageView: UIImageView!
    @IBOutlet weak private var trackTime: UILabel!
    @IBOutlet weak private var playTime: UILabel!
    @IBOutlet weak private var trackTitle: UILabel!
    @IBOutlet weak private var artist: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak private var playTimeSlider: UISlider!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))

    private var playingTimeTimer : NSTimer?
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = ""
        if PlayerManager.sharedInstance.players.count == 0 {
            PlayerManager.sharedInstance.setPlaylist(playlist!)
            PlayerManager.sharedInstance.play()
            playButton.selected = true
        }
        if PlayerManager.sharedInstance.playlist != playlist {
            PlayerManager.sharedInstance.setPlaylist(playlist!)
            PlayerManager.sharedInstance.toPlayIndex = 0
            PlayerManager.sharedInstance.play()
            playButton.selected = true
        }

        updatePlayingInfo()
    }

    override func viewDidDisappear(animated: Bool) {
        playingTimeTimer?.invalidate()
    }

    @IBAction func playAndPauseButtonTouchUpInside(sender: UIButton) {
        if PlayerManager.sharedInstance.isPlaying() {
            PlayerManager.sharedInstance.pause()
            playButton.selected = false
        }else{
            PlayerManager.sharedInstance.play()
            playButton.selected = true
        }
    }

    @IBAction func nextButtonTouchUpInside(sender: UIButton) {
        PlayerManager.sharedInstance.playNextSong()
    }

    @IBAction func backButtonTouchUpInside(sender: UIButton) {
        PlayerManager.sharedInstance.playPrevSong()
    }

    @IBAction func playTimeSliderAction(sender: AnyObject) {
        playingTimeTimer?.invalidate()
    }

    @IBAction func shuffleButtonTouchUpInside(sender: UIButton) {
        sender.selected = !sender.selected
    }

    @IBAction func repeatButtonTouchUpInside(sender: UIButton) {
        sender.selected = !sender.selected
    }


    @IBAction func endEditing(sender: AnyObject) {
        PlayerManager.sharedInstance.setProgress(self.playTimeSlider.value)
        playingTimeTimer = NSTimer.scheduledTimerWithTimeInterval(
            0.01,
            target: self,
            selector: "updatePlayingInfo",
            userInfo: nil,
            repeats: true
        )
        playingTimeTimer?.fire()
    }

    func setupView(){
        blurView.frame = UIScreen.mainScreen().bounds
        blurImageView.addSubview(blurView)
        self.playTimeSlider.maximumValue = 1.0

        playingTimeTimer = NSTimer.scheduledTimerWithTimeInterval(
            0.01,
            target: self,
            selector: "updatePlayingInfo",
            userInfo: nil,
            repeats: true
        )
        playTimeSlider.setThumbImage(UIImage(named: "SliderThumb"), forState: .Normal)
        playTimeSlider.setThumbImage(UIImage(named: "SliderThumb"), forState: .Highlighted)
        playTimeSlider.tintColor = UIColor(red: 128/255, green: 128/255, blue: 227/255, alpha: 1)
    }

    func updatePlayingInfo() {
        trackTime.text = PlayerManager.sharedInstance.playTime() ?? "00:00"
        playTime.text = PlayerManager.sharedInstance.playingTime() ?? "00:00"
        playTimeSlider.value = PlayerManager.sharedInstance.getProgress() ?? Float(0.0)

        trackTitle.text = PlayerManager.sharedInstance.title() ?? "TITLE"
        artist.text = PlayerManager.sharedInstance.artist() ?? "ARTIST"
        firstImageView.sd_setImageWithURL(PlayerManager.sharedInstance.artworkUrl())
        blurImageView.sd_setImageWithURL(PlayerManager.sharedInstance.artworkUrl())
        let numberOfSongs = playlist?.musicTracks.count
        let toPlayIndex = PlayerManager.sharedInstance.toPlayIndex
        switch PlayerManager.sharedInstance.toPlayIndex {
            case (numberOfSongs! - 2):
                secondImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[toPlayIndex + 1].artworkUrl ?? ""))
                thirdImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[0].artworkUrl ?? ""))
            case (numberOfSongs! - 1):
                secondImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[0].artworkUrl ?? ""))
                thirdImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[1].artworkUrl ?? ""))
            default:
                secondImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[toPlayIndex + 1].artworkUrl ?? ""))
                thirdImageView.sd_setImageWithURL(NSURL(string: playlist?.musicTracks[toPlayIndex + 2].artworkUrl ?? ""))
        }
    }
}
