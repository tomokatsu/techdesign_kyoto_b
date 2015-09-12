//
//  PlaylistInfoCell.swift
//  Inspire
//
//  Created by IllyasvielVonEinzbern on 9/12/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class PlaylistInfoCell: ISPTableViewCell {


    @IBOutlet weak var trackNumberLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var inspireButton: UIButton!
    @IBOutlet weak var additionalButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        inspireButton.layer.borderColor = UIColor.whiteColor().CGColor
    }
}
