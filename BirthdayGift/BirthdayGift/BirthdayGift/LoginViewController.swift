//
//  LoginViewController.swift
//  BirthdayGift
//
//  Created by tederen on 2017/10/24.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit
import AVFoundation


class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var musicPlayImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginButton.layer.cornerRadius = 22
        self.loginButton.layer.masksToBounds = true
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = Double.pi*2
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        self.musicPlayImg.layer.add(animation, forKey: nil)
        
        MusicHandle.shareMusicHandle.play(0)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func loginIn(_ sender: UIButton) {
        
        if (self.nameTextField.text == "") {
            self.showAlert("Sorry,请填写贝儿最爱的人的姓名", message: "是名字首字母哦")
            return
        }
        if (self.nameTextField.text != "csp") {
            self.showAlert("Sorry,这不是贝儿最爱的人", message: "请重新填写哦~")
            return
        }
        if (self.timeTextField.text == "") {
            self.showAlert("Sorry,请填写贝儿爱宝儿的时长", message: "是汉字哦")
            return
        }
        if (self.timeTextField.text != "一生一世") {
            self.showAlert("Sorry,这不是贝儿爱宝儿的时长", message: "请重新填写哦~")
            return
        }
        if self.selectButton.isSelected != true {
            self.showAlert("Sorry,请同意贝儿和宝儿的爱的誓言", message: "请认真阅读爱的誓言并遵守")
            return
        }
        UserDefaults.standard.set(true, forKey: "isLogin")
        let vc:MainTabbarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabbarViewController") as! MainTabbarViewController
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.navigationController?.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func selectProtocolButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    func showAlert(_ title:String?,message:String?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "知道啦", style: UIAlertActionStyle.default, handler: nil))
        
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
}

