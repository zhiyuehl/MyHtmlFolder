//
//  RIViewController.swift
//  BirthdayGift
//
//  Created by tederen on 2017/10/25.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit
import WebKit


class RIViewController: BaoBaoViewController {

    
//    lazy var webView: WKWebView = {
//        let web:WKWebView = WKWebView(frame: CGRect(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight))
//        web.uiDelegate = self
//        return web
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+10.0) {
            self.tabBarController?.tabBar.isUserInteractionEnabled = true
        }
        
        self .showBirthdayViewController()
        
        
    }

    @IBAction func actionBirthday(_ sender: Any) {
        self.showBirthdayViewController()
    }
    
    func showBirthdayViewController() -> Void {
        let birthdayItem = YKBirthdayItem()
        birthdayItem.birthdayTitle = "亲爱的最爱的宝儿老婆"
        birthdayItem.birthdaySubTitle = "祝宝儿老婆生日快乐，永远18岁！😆"
        birthdayItem.birthdayDescriptionTitle = "送你支付宝红包，49142344"
        YKBirthdayMgr.shareInstance().showBirthdayView(in: self, birthdayItem: birthdayItem)
    }
    

}
