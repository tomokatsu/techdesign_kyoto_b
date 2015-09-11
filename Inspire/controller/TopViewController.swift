import UIKit

class TopViewController: ISPViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    static let cellHeightWidthRatio = CGFloat(182.0 / 320.0)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? TopTableViewCell ?? TopTableViewCell()
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TopViewController.cellHeightWidthRatio * UIScreen.mainScreen().bounds.width
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }



}
