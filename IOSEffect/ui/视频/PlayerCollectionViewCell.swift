//
//  PlayerCollectionViewCell.swift
//  IOSEffect
//
//  Created by xubojoy on 2017/10/17.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {

    var data:DataObj? {
        didSet {
            self.imgView.image = data?.image
            self.labelTitle.text = data?.title
        }
    }
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgView.isHidden = false
        data = nil
    }

}
