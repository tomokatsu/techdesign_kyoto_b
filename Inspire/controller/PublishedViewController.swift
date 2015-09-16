import UIKit

class PublishedViewController: ISPViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
    }

    @IBAction func moveToTopButtonTouchUpInside(sender: UIButton) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).moveTop()
    }

}
