//
//  LEViewController.swift
//  BirthdayGift
//
//  Created by tederen on 2017/10/25.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit

class LEViewController: BaoBaoViewController {

    var layerArray = Array<CALayer>()
    var rootLayer: CALayer?
    
    var index: Int = 0
    
    var timer: Timer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let miss = CUSSenderStarLayer()
        let birthday = CUSSenderBirthdayLayer()
        let kiss = CUSSenderKissLayer()
        let flower = CUSSenderFlowerLayer()
        
        self.layerArray.append(miss)
        self.layerArray.append(birthday)
        self.layerArray.append(kiss)
        self.layerArray.append(flower)
        
        self.timer = Timer.scheduledTimer(timeInterval: 25.0, target: self, selector: #selector(self.changeLayer), userInfo: nil, repeats: true)
    }
    
    @objc func changeLayer() {
        self.index += 1
        if self.index == self.layerArray.count {
            self.index = 0
        }
        self.rootLayer?.removeFromSuperlayer()
        self.rootLayer = self.createLayer()
        self.view.layer.addSublayer(self.rootLayer!)
    }
    
    
    func createLayer() ->CALayer {
        
        return self.layerArray[index]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.rootLayer = self.createLayer()
        self.view.layer.addSublayer(self.rootLayer!)
        self.timer.fireDate = Date.distantPast
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let _ = self.rootLayer {
            self.rootLayer?.removeFromSuperlayer()
            self.timer.fireDate = Date.distantFuture
        }
    }
    

}
