//
//  SHENGViewController.swift
//  BirthdayGift
//
//  Created by tederen on 2017/10/25.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit

let Star_WidthWithHeight:CGFloat = 15.0

class SHENGViewController: BaoBaoViewController {

    let rotation: CABasicAnimation = CABasicAnimation()
    
    var first: Bool = false
    
    let fireView: FireView = FireView()
    
    let star: Stars = Stars()
    
    var boomLayer: CAEmitterLayer = CAEmitterLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = true
        
        self.boom()
        
        self.star.frame = CGRect(x: CGFloat(ScreenWidth)-Star_WidthWithHeight, y: CGFloat(ScreenHeight)-Star_WidthWithHeight, width: Star_WidthWithHeight, height: Star_WidthWithHeight)
        
        let weakSelf: SHENGViewController = self
        self.star.actionFire {
            let view = DrowLine(frame: weakSelf.view.bounds)
            weakSelf.view.addSubview(view)
        }
        
        self.star.actionBoom {
            if weakSelf.first == true {
                weakSelf.actionBoom2()
            }else {
                weakSelf.actionBoom1()
            }
            weakSelf.first = !weakSelf.first
        }
        self.view.addSubview(self.star)
        self.star.image = #imageLiteral(resourceName: "1_star_3")
    }

    func boom() {
        let cell = CAEmitterCell()
        cell.name = "explosion"
        cell.birthRate = 0
        cell.velocity = 110
        cell.velocityRange = 20
        cell.contents = UIImage.init(named: "1_star_3")?.cgImage
        cell.alphaRange = 0.10
        cell.alphaSpeed = -1.0
        cell.lifetime = 0.5
        cell.lifetimeRange = 0.2
        cell.scale = 0.01
        
        self.boomLayer = CAEmitterLayer()
        self.boomLayer.name = "emitterLayer"
        self.boomLayer.position = CGPoint(x: ScreenWidth/2, y: ScreenHeight/2-self.star.height/2)
        self.boomLayer.emitterMode = kCAEmitterLayerOutline
        self.boomLayer.emitterShape = kCAEmitterLayerCircle
        self.boomLayer.renderMode = kCAEmitterLayerOldestFirst
        self.boomLayer.emitterSize = CGSize(width: 0, height: 0)
        self.boomLayer.masksToBounds = false
        
        self.boomLayer.emitterCells = [cell];
        self.view.layer.addSublayer(self.boomLayer)
        
        
        
    }
    
    @IBAction func action(_ sender: ActionButton) {
        sender.isSelected = !sender.isSelected
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.3) {
            self.starGo()
        }
        
        self.tabBarController?.tabBar.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+10.0) {
            self.tabBarController?.tabBar.isUserInteractionEnabled = true
        }
    }
    
    func starGo()  {
        self.star.animationMove()
    }
    
    func actionBoom1() {
        self.boomLayer.setValue(4500, forKeyPath: "emitterCells.explosion.birthRate")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.2) {
            self.stopBoom()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
            self.changeBoomPoint()
        }
    }
    
    func actionBoom2() {
        self.boomLayer.setValue(4500, forKeyPath: "emitterCells.explosion.birthRate")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.2) {
            self.stopBoom()
        }
    }
    
    func stopBoom() {
        self.boomLayer.setValue(0, forKeyPath: "emitterCells.explosion.birthRate")
    }
    
    func changeBoomPoint() {
        self.boomLayer.setValue(ScreenWidth/2, forKeyPath: "position.x")
        self.boomLayer.setValue(80, forKeyPath: "position.y")
    }
    
    
}
