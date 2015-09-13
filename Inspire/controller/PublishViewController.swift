
import UIKit
import DOAlertController

class PublishViewController: ISPViewController, UITextFieldDelegate {

    @IBOutlet weak var backBlurImageView: UIImageView!

    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
    @IBOutlet weak var moodLabel: UILabel!

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        moodLabel.text = ""
        (self.navigationController?.navigationBar as? ISPNavigationBar)?.hide()
        layoutView()

        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    func keyboardWillShow(notification: NSNotification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
        let frame = notification.userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue()

        UIView.animateWithDuration(duration, animations: {
            self.view.frame = CGRectMake(0, -CGRectGetHeight(frame), self.view.frame.width, self.view.frame.height)
            self.view.layoutIfNeeded()
        })
    }

    func keyboardWillHide(notification: NSNotification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey]!.doubleValue

        UIView.animateWithDuration(duration, animations: {
            self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
            self.view.layoutIfNeeded()

        })
    }

    func layoutView() {
        blurView.frame = UIScreen.mainScreen().bounds
        backBlurImageView.addSubview(blurView)
    }

    @IBAction func moodSelectButtonTouchUpInside(sender: UIButton) {
        showMoodActionSheet()
    }

    @IBAction func moodLabelTapped(sender: UITapGestureRecognizer) {
        showMoodActionSheet()
    }

    @IBAction func publishButtonTouchUpInside(sender: UIBarButtonItem) {
        let publishedView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        publishedView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        let messageLabel = UILabel(frame: CGRectMake(20, 200, UIScreen.mainScreen().bounds.width - 40, 40))
        messageLabel.text = "プレイリストの作成が完了しました"
        messageLabel.font = UIFont(name: "mplus-1p-regular", size: 16)
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.textAlignment = .Center
        publishedView.addSubview(messageLabel)

        let checkButton = UIButton(frame: CGRectMake((UIScreen.mainScreen().bounds.width / 2) - 40, 260, 80, 80))
        checkButton.setBackgroundImage(UIImage(named: "check"), forState: .Normal)
        checkButton.addTarget(self, action: Selector("moveTop"), forControlEvents: .TouchUpInside)
        publishedView.addSubview(checkButton)
        self.navigationController?.navigationBarHidden = true
        self.view.addSubview(publishedView)
    }

    func moveTop() {
        (UIApplication.sharedApplication().delegate as! AppDelegate).moveTop()
    }

    func showMoodActionSheet() {
        let alertController = DOAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alertController.alertViewBgColor = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)
        alertController.buttonFont[.Default] = UIFont(name: "mplus-1p-light", size: 12.0)
        alertController.buttonTextColor[.Default] = UIColor.whiteColor()
        alertController.buttonBgColor[.Default] = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)
        alertController.buttonBgColorHighlighted[.Default] = UIColor(red: 0.149019608, green: 0.149019608, blue: 0.164705882, alpha: 1)

        alertController.addAction(DOAlertAction(title: "Happy", style: .Default) { action in
            self.moodLabel.text = "Happy"
        })
        alertController.addAction(DOAlertAction(title: "Excited", style: .Default) { action in
            self.moodLabel.text = "Excited"
        })
        alertController.addAction(DOAlertAction(title: "Relax", style: .Default) { action in
            self.moodLabel.text = "Relax"
        })
        alertController.addAction(DOAlertAction(title: "Love", style: .Default) { action in
            self.moodLabel.text = "Love"
        })

        alertController.addAction(DOAlertAction(title: "Cancel", style: .Default) { action in
            self.moodLabel.text = ""
        })

        presentViewController(alertController, animated: true, completion: {

        })
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            let separatorView = UIView(frame: CGRectMake(0, alertController.buttonAreaScrollView.frame.height - 55, UIScreen.mainScreen().bounds.width, 0.5))
            separatorView.backgroundColor = UIColor.whiteColor()
            alertController.buttonAreaScrollView.addSubview(separatorView)
            alertController.buttonAreaScrollView.bringSubviewToFront(separatorView)
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
