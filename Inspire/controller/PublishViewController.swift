
import UIKit

class PublishViewController: ISPViewController {

    @IBOutlet weak var backBlurImageView: UIImageView!
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
        layoutView()
    }

    func layoutView() {
        blurView.frame = UIScreen.mainScreen().bounds
        backBlurImageView.addSubview(blurView)
    }

    override func viewDidLayoutSubviews() {
    }
}
