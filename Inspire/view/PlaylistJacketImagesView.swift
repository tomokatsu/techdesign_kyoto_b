
import UIKit

class PlaylistJacketImagesView: UIView {

    let mainImageView = UIImageView()
    var subImageViews: [UIImageView] = []

    var images: [UIImage] {
        get {
            return self.images
        }

        set(images) {
            self.images = images
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
        mainImageView.backgroundColor = UIColor.yellowColor()
        self.addSubview(mainImageView)
        mainImageView.image = UIImage(named: "dammy.jpg")
        let subImageViewSize = CGSizeMake(floor(viewSize.height/2), floor(viewSize.height/2))
        for i in 0...5 {
            let subImageView = UIImageView(frame: CGRectMake(0, 0, subImageViewSize.width, subImageViewSize.width))
            var subImageViewFrame = subImageView.frame
            subImageViewFrame.origin.x = CGFloat(Int(i/2)) * subImageViewSize.width + mainImageView.frame.size.width
            if i%2 == 1 {
                subImageViewFrame.origin.y = subImageViewSize.height
            }
            subImageView.frame = subImageViewFrame

            subImageView.image = UIImage(named: "dammy.jpg")

            self.addSubview(subImageView)
            subImageViews.append(subImageView)
        }
    }

    override func layoutSubviews() {
        let viewSize = self.frame.size
        mainImageView.frame = CGRectMake(0, 0, viewSize.height, viewSize.height)
        mainImageView.backgroundColor = UIColor.yellowColor()

        let subImageViewSize = CGSizeMake(floor(viewSize.height/2), floor(viewSize.height/2))
        for i in 0...5 {
            let subImageView = subImageViews[i]
            var subImageViewFrame = subImageView.frame
            subImageViewFrame.size = subImageViewSize
            subImageViewFrame.origin.x = CGFloat(Int(i/2)) * subImageViewSize.width + mainImageView.frame.size.width
            if i%2 == 1 {
                subImageViewFrame.origin.y = subImageViewSize.height
            }
            subImageView.frame = subImageViewFrame
        }
        self.superview?.layoutIfNeeded()
    }
}
