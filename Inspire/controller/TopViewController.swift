import UIKit
import RealmSwift

class TopViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var scrollView: ISPPagingScrollView!
    static let cellHeightWidthRatio = CGFloat(190.0 / 320.0)
    let realm = Realm()
    var myPlaylists: Results<Playlist>?
    var inspirablePlaylists: Results<Playlist>?

    override func viewDidLoad() {
        super.viewDidLoad()
        myPlaylists = realm.objects(Playlist).filter("isInspire = true")
        inspirablePlaylists = realm.objects(Playlist).filter("isInspire = false")
        layoutViews()

    }

    override func viewWillAppear(animated: Bool) {
        title = "Inspire"
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.show()
    }

    override func viewWillDisappear(animated: Bool) {
        title = ""
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
            tableView.tag = i
            tableView.registerNib(UINib(nibName: "TopTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        }
    }

    @IBAction func segmentControlValueChanged(sender: UISegmentedControl) {
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.size.width * CGFloat(sender.selectedSegmentIndex), y: 0.0), animated: true)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var pageWidth = self.scrollView.frame.size.width
        segmentControl.selectedSegmentIndex = lround(Double(self.scrollView.contentOffset.x / pageWidth))
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
            case 0:
                return myPlaylists?.count ?? 0
            case 1:
                return inspirablePlaylists?.count ?? 0
            default:
                return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? TopTableViewCell ?? TopTableViewCell()
        cell.backgroundColor = UIColor(red: 0.11372549, green: 0.11372549, blue: 0.125490196, alpha: 1)
        cell.selectionStyle = .None

        let playlist: Playlist
        if tableView.tag == 0 {
            playlist = myPlaylists![indexPath.row]
        } else {
            playlist = inspirablePlaylists![indexPath.row]
        }

        cell.playlist = playlist

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TopViewController.cellHeightWidthRatio * UIScreen.mainScreen().bounds.width
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let playlistViewController = storyboard?.instantiateViewControllerWithIdentifier("PlaylistViewController") as! PlaylistViewController
        let playlist: Playlist
        if tableView.tag == 0 {
            playlist = myPlaylists![indexPath.row]
        } else {
            playlist = inspirablePlaylists![indexPath.row]
        }
        playlistViewController.playlist = playlist
        self.navigationController?.pushViewController(playlistViewController, animated: true)
    }
}
