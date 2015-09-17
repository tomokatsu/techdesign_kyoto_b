import UIKit
import RealmSwift

class TopViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    enum CurrentDisplayPage {
        case MyFeed
        case MyPlaylist
    }

    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak private var scrollView: ISPPagingScrollView!
    static let cellHeightWidthRatio = CGFloat(218.0 / 320.0)
    let realm = Realm()
    var myPlaylists: Results<Playlist>?
    var inspirablePlaylists: Results<Playlist>?
    var beganPoint = CGPointZero

    @IBOutlet weak var myPlaylistButton: UIButton!
    @IBOutlet weak var myFeedButton: UIButton!
    var currentPage: CurrentDisplayPage = .MyFeed {
        didSet {
            switchSegment()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentView.layer.borderColor = UIColor.blackColor().CGColor
        myPlaylists = realm.objects(Playlist).filter("isInspire = true")
        inspirablePlaylists = realm.objects(Playlist).filter("isInspire = false")
        let titleView = UIImageView(frame: CGRectMake(0, 40, 202*0.625, 34*0.625))
        titleView.image = UIImage(named: "title")
        titleView.contentMode = .ScaleAspectFit
        navigationItem.titleView = titleView
        layoutViews()
        currentPage = .MyFeed
        scrollView.pagingEnabled = true
    }

    override func viewWillAppear(animated: Bool) {
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.show()
    }

    override func viewWillDisappear(animated: Bool) {
        title = ""
    }

    func layoutViews() {
        var tableViewFrame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 115)

        scrollView.contentSize = CGSizeMake(tableViewFrame.size.width * 2, UIScreen.mainScreen().bounds.height - 115)
        for i in 0...1 {
            let tableView = UITableView(frame: tableViewFrame)
            scrollView.addSubview(tableView)
            tableViewFrame.origin.x = tableViewFrame.origin.x + tableViewFrame.width
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = UIColor(red: 38/255, green: 38/255, blue: 42/255, alpha: 1)
            tableView.separatorStyle = .None
            tableView.tag = i
            tableView.registerNib(UINib(nibName: "TopTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        }
        myPlaylistButton.setBackgroundImage(createImageWithColor(UIColor.blackColor()), forState: .Disabled)
        myPlaylistButton.setTitleColor(UIColor.whiteColor(), forState: .Disabled)
        myPlaylistButton.setTitleColor(UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1), forState: .Selected)
        myPlaylistButton.setTitleColor(UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1), forState: .Highlighted)
        myFeedButton.setBackgroundImage(createImageWithColor(UIColor.blackColor()), forState: .Disabled)
        myFeedButton.setTitleColor(UIColor.whiteColor(), forState: .Disabled)
        myFeedButton.setTitleColor(UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1), forState: .Selected)
        myFeedButton.setTitleColor(UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1), forState: .Highlighted)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
            case 0:
                return inspirablePlaylists?.count ?? 0
            case 1:
                return myPlaylists?.count ?? 0
            default:
                return 0
        }
    }

    var previousPage = 0
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.isKindOfClass(UITableView) { return }
        let pageWidth = scrollView.frame.size.width
        let fractionalPage = scrollView.contentOffset.x / pageWidth
        let page = lround(Double(fractionalPage))
        if previousPage != page {
            switch page {
                case 0:
                    currentPage = .MyFeed
                case 1:
                    currentPage = .MyPlaylist
                default:
                    break
            }
            previousPage = page
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? TopTableViewCell ?? TopTableViewCell()
        cell.backgroundColor = UIColor(red: 38/255, green: 38/255, blue: 42/255, alpha: 1)
        cell.selectionStyle = .None

        let playlist: Playlist
        if tableView.tag == 0 {
            playlist = inspirablePlaylists![indexPath.row]
        } else {
            playlist = myPlaylists![indexPath.row]
        }

        cell.playlist = playlist

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UIScreen.mainScreen().bounds.width / 2 + 58
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let playlistViewController = storyboard?.instantiateViewControllerWithIdentifier("PlaylistViewController") as! PlaylistViewController
        let playlist: Playlist
        if tableView.tag == 0 {
            playlist = inspirablePlaylists![indexPath.row]
        } else {
            playlist = myPlaylists![indexPath.row]
        }
        playlistViewController.playlist = playlist
        self.navigationController?.pushViewController(playlistViewController, animated: true)
    }

    @IBAction func myPlaylistButtonTouchUpInside(sender: AnyObject) {
        currentPage = .MyPlaylist
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.size.width * CGFloat(1), y: 0.0), animated: true)
    }

    @IBAction func myFeedButtonTouchUpInside(sender: UIButton) {
        currentPage = .MyFeed
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.size.width * CGFloat(0), y: 0.0), animated: true)
    }

    func switchSegment() {
        switch currentPage {
            case .MyFeed:
                myFeedButton.enabled = false
                myPlaylistButton.enabled = true
            case .MyPlaylist:
                myFeedButton.enabled = true
                myPlaylistButton.enabled = false
        }
    }

    func createImageWithColor(color: UIColor) -> UIImage {
        var rect = CGRectMake(0, 0, 1, 1);
        UIGraphicsBeginImageContext(rect.size);
        let contextRef = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(contextRef, color.CGColor);
        CGContextFillRect(contextRef, rect);
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}
