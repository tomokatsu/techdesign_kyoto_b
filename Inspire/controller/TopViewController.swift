import UIKit
import RealmSwift

class TopViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: ISPPagingScrollView!
    static let cellHeightWidthRatio = CGFloat(190.0 / 320.0)
    let realm = Realm()
    var playlists: Results<Playlist>?

    override func viewDidLoad() {
        super.viewDidLoad()
        playlists = realm.objects(Playlist)
        layoutViews()

    }

    func layoutViews() {
        var tableViewFrame = UIScreen.mainScreen().applicationFrame
        scrollView.contentSize = CGSizeMake(tableViewFrame.size.width * 2, scrollView.frame.height)
        scrollView.pagingEnabled = true
        for i in 0...1 {
            let tableView = UITableView(frame: tableViewFrame)
            scrollView.addSubview(tableView)
            tableViewFrame.origin.x = tableViewFrame.origin.x + tableViewFrame.width
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = UIColor(red: 29/255, green: 29/255, blue: 32/255, alpha: 1)
            tableView.separatorStyle = .None
            tableView.registerNib(UINib(nibName: "TopTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        }
    }
    @IBAction func pageControlValueChanged(sender: UIPageControl) {
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.size.width * CGFloat(sender.currentPage), y: 0.0), animated: true)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var pageWidth = self.scrollView.frame.size.width
        pageControl.currentPage = lround(Double(self.scrollView.contentOffset.x / pageWidth))
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func viewWillAppear(animated: Bool) {
        title = "Inspire"
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.show()
    }

    override func viewWillDisappear(animated: Bool) {
        title = ""
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? TopTableViewCell ?? TopTableViewCell()
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? TopTableViewCell ?? TopTableViewCell()
        cell.backgroundColor = UIColor(red: 0.11372549, green: 0.11372549, blue: 0.125490196, alpha: 1)
        cell.selectionStyle = .None
        let playlist = Playlist()
        playlist.title = "test test testあ"
        playlist.playlister = "テストユーザー"

        var tracks = List<MusicTrack>()
        for i in 0...7 {
            let track = MusicTrack()
            track.title = "test song"
            track.artworkUrl = "http://vector-sozai.up.seesaa.net/image/HumanSkulls.png"
            track.artist = "test artist"
            tracks.append(track)
        }
        playlist.musisTracks = tracks

        cell.titleLabel.text = playlist.title
        cell.playlisterLabel.text = playlist.playlister

        var artWorkURLs: [String] = []
        for (index, musicTrack) in enumerate(playlist.musisTracks) {
            if index > 5 { break }
            artWorkURLs.append(musicTrack.artworkUrl)
        }
        cell.playlistJacketImagesView.artWorkURLs = artWorkURLs
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TopViewController.cellHeightWidthRatio * UIScreen.mainScreen().bounds.width
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let playlistViewController = storyboard?.instantiateViewControllerWithIdentifier("PlaylistViewController") as! PlaylistViewController
        self.navigationController?.pushViewController(playlistViewController, animated: true)
    }



}
