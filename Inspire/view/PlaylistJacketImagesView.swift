
import UIKit
import SDWebImage

class PlaylistJacketImagesView: UIView {

    let mainImageView = UIImageView()
    var subImageViews: [UIImageView] = []
    private var _artWorksURL: [String] = []
    private var gradientView = UIView()

    var artWorkURLs: [String] {
        get {
            return _artWorksURL
        }

        set(artWorkURLs) {
            _artWorksURL = artWorkURLs
            layoutIfNeeded()
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubViews()
    }

    func initSubViews() {
        let viewSize = self.frame.size
        mainImageView.frame = CGRectMake(0, 0, viewSize.height, viewSize.height)
        self.addSubview(mainImageView)
        let subImageViewSize = CGSizeMake(viewSize.height/2, viewSize.height/2)
        for i in 0...4 {
            let subImageView = UIImageView(frame: CGRectMake(0, 0, subImageViewSize.width, subImageViewSize.width))
            var subImageViewFrame = subImageView.frame
            subImageViewFrame.origin.x = CGFloat(Int(i/2)) * subImageViewSize.width + mainImageView.frame.size.width
            if i%2 == 1 {
                subImageViewFrame.origin.y = subImageViewSize.height
            }
            subImageView.frame = subImageViewFrame

            self.addSubview(subImageView)
            subImageViews.append(subImageView)
        }
        gradientView.frame = self.bounds
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.45).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.60).CGColor
        ]
        gradientView.layer.insertSublayer(gradient, atIndex: 0)
        self.addSubview(gradientView)
        bringSubviewToFront(gradientView)
    }

    override func layoutSubviews() {
        let viewSize = self.frame.size
        mainImageView.frame = CGRectMake(0, 0, viewSize.height, viewSize.height)
        mainImageView.sd_setImageWithURL(NSURL(string: artWorkURLs[0]))
        let subImageViewSize = CGSizeMake(viewSize.height/2, viewSize.height/2)
        for i in 0...4 {
            let subImageView = subImageViews[i]
            var subImageViewFrame = subImageView.frame
            subImageViewFrame.size = subImageViewSize
            subImageViewFrame.origin.x = CGFloat(Int(i/2)) * subImageViewSize.width + mainImageView.frame.size.width
            if i%2 == 1 {
                subImageViewFrame.origin.y = subImageViewSize.height
            }
            subImageView.sd_setImageWithURL(NSURL(string: artWorkURLs[i + 1]))
            subImageView.frame = subImageViewFrame
        }
        (gradientView.layer.sublayers[0] as! CAGradientLayer).frame = self.bounds
        self.superview?.layoutIfNeeded()
    }
}
