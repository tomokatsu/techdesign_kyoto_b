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

    var musicTrack = MusicTrack()
    var musicTracks = List<MusicTrack>()
    var playList = Playlist()

    var playingTimeTimer : NSTimer?
    var testDraw: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        musicTrack.previewUrl = "http://a601.phobos.apple.com/us/r1000/072/Music/v4/7b/96/fa/7b96fa0b-6c99-6402-3517-6b495db76ef8/mzaf_7307640393574451724.aac.m4a"

        musicTracks.append(musicTrack)
        playList.musisTracks = musicTracks

        PlayerManager.sharedInstance.currentPlayngTrack = musicTrack

        // Screen Size の取得
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height

        testDraw = drawCircle(frame: CGRectMake(20, 20, screenWidth-80, screenHeight-360))
        self.view.addSubview(testDraw!)
    }

    @IBAction func playAndPauseButtonTouchUpInside(sender: UIButton) {
        if PlayerManager.sharedInstance.isPlaying {
            PlayerManager.sharedInstance.stop()
        }else{
            PlayerManager.sharedInstance.play()

            if (playingTimeTimer == nil) {
                playingTimeTimer = NSTimer.scheduledTimerWithTimeInterval(
                    0.1,
                    target: self,
                    selector: "updatePlayingTime",
                    userInfo: nil,
                    repeats: true
                )
            }

            let url = NSURL(string: musicTrack.previewUrl)
            let avAsset = AVURLAsset(URL: url!, options: nil)
            var durationTime = CMTimeGetSeconds(avAsset.duration)
            trackTime.text = self.formatTimeString(durationTime)
        }
    }

    @IBAction func nextButtonTouchUpInside(sender: UIButton) {
        PlayerManager.sharedInstance.next()
    }

    @IBAction func backButtonTouchUpInside(sender: UIButton) {
        PlayerManager.sharedInstance.back()
    }

    func updatePlayingTime() {
        var time = CMTimeGetSeconds(PlayerManager.sharedInstance.audioPlayer!.currentTime())
        playTime.text = self.formatTimeString(time)

        var angle = CGFloat(M_PI*2.0 / 100.0)
        //end_angle = end_angle +  angle
    }

    func formatTimeString(d : Double) -> String {
        let h : Int = Int(d / 3600)
        let m : Int = Int((d - Double(h) * 3600) / 60)
        let s : Int = Int(d - 3600 * Double(h)) - m * 60
        let str = String(format: "%02d:%02d:%02d", h, m, s)

        return str
    }
}

class drawCircle: UIView {
    var _endAngle: CGFloat = 1.0

    override func drawRect(rect: CGRect) {
        // 円弧 -------------------------------------
        var arc = UIBezierPath(arcCenter: CGPoint(x:100, y:100), radius: 85,  startAngle: 0, endAngle: CGFloat(M_PI)*_endAngle, clockwise: true)
        // 透明色設定
        var aColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        aColor.setStroke()
        arc.lineWidth = 10

        // 点線のパターンをセット
        var dashPattern:[CGFloat] = [ 1 , 4 ]
        arc.setLineDash(dashPattern, count: 2, phase: 0)
        arc.stroke()
    }
}
