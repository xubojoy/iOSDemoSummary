//
//  WaterDropController.swift
//  IOSEffect
//
//  Created by xubojoy on 2017/10/16.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit

class WaterDropController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.darkGray
        self.title = "下雨动画"
        let waterDropView = WaterDropsView {
            $0.color = UIColor.white
            $0.dropNum = 30
            $0.startAnimation()
        }
        self.view.addSubview(waterDropView)
        waterDropView.bindFrameToSuperviewBounds()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIView {
    
    func bindFrameToSuperviewBounds() {
        
        guard let superview = self.superview else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[subview]-(0)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[subview]-(0)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
}

