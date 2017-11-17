//
//  BaoBaoViewController.swift
//  BirthdayGift
//
//  Created by tederen on 2017/10/26.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit

class BaoBaoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .red
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = Double.pi*2
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        imageview.image = #imageLiteral(resourceName: "播放音乐")
        let barItem = UIBarButtonItem(customView: imageview)
        self.navigationItem.rightBarButtonItem = barItem
        self.navigationItem.rightBarButtonItem?.customView?.layer.add(animation, forKey: nil)
    }

    
}
