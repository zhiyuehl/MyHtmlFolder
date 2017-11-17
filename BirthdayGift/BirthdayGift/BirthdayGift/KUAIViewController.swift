//
//  MainViewController.swift
//  BirthdayGift
//
//  Created by tederen on 2017/10/25.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit
import UICountingLabel

class KUAIViewController: BaoBaoViewController {

    @IBOutlet weak var dayLabel: UICountingLabel!
    
    @IBOutlet weak var hourLabel: UICountingLabel!
    
    @IBOutlet weak var minuteLabel: UICountingLabel!
    
    @IBOutlet weak var secondLabel: UICountingLabel!
    
    @IBOutlet weak var remainLabel: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var beginIntroLabel: UILabel!
    
    @IBOutlet weak var endIntroLabel: UILabel!
    
    @IBOutlet weak var nowIntroLabel: UILabel!
    
    let beginTime = "2013-07-19 00:00:00"
    
    let futureTime = "2113-07-19 00:00:00"
    
    var beginDate: Date!
    
    var futureDate: Date!
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.timer = Timer(fireAt: Date.distantFuture, interval: 1.0, target: self, selector: #selector(self.repeatNumberOfDays), userInfo: nil, repeats: true)
        
        
        MusicHandle.shareMusicHandle.play(1)
        
        self.setupDaysView()
        
        self.setupTimeLineView()
        
    }
    //时间轴
    func setupTimeLineView() {
        let besizerPath = UIBezierPath()
        besizerPath.move(to: CGPoint(x: 0, y: 60))
        besizerPath.addLine(to: CGPoint(x: 50, y: 60))
        besizerPath.addLine(to: CGPoint(x: 50, y: 45))
        besizerPath.addLine(to: CGPoint(x: 50, y: 60))//2013
        besizerPath.addLine(to: CGPoint(x: 150, y: 60))
        besizerPath.addLine(to: CGPoint(x: 150, y: 45))
        besizerPath.addLine(to: CGPoint(x: 150, y: 60))
        besizerPath.addLine(to: CGPoint(x: 160, y: 60))
        
        besizerPath.move(to: CGPoint(x: 170, y: 60))
        besizerPath.addLine(to: CGPoint(x: 180, y: 60))

        besizerPath.move(to: CGPoint(x: 190, y: 60))
        besizerPath.addLine(to: CGPoint(x: 200, y: 60))
        
        besizerPath.move(to: CGPoint(x: 210, y: 60))
        besizerPath.addLine(to: CGPoint(x: 220, y: 60))
        
        besizerPath.move(to: CGPoint(x: 230, y: 60))
        besizerPath.addLine(to: CGPoint(x: 240, y: 60))
        
        besizerPath.move(to: CGPoint(x: 250, y: 60))
        besizerPath.addLine(to: CGPoint(x: 260, y: 60))
        
        besizerPath.move(to: CGPoint(x: 270, y: 60))
        besizerPath.addLine(to: CGPoint(x: 280, y: 60))
        
        besizerPath.move(to: CGPoint(x: 290, y: 60))
        besizerPath.addLine(to: CGPoint(x: 300, y: 60))
        
        besizerPath.move(to: CGPoint(x: 310, y: 60))
        besizerPath.addLine(to: CGPoint(x: 320, y: 60))
        
        besizerPath.addLine(to: CGPoint(x: 320, y: 45))
        besizerPath.addLine(to: CGPoint(x: 320, y: 60))
        besizerPath.addLine(to: CGPoint(x: 375, y: 60))
        
        let shaperlayer = CAShapeLayer()
        shaperlayer.path = besizerPath.cgPath
        shaperlayer.lineWidth = 3
        shaperlayer.strokeColor = UIColor.red.cgColor
        shaperlayer.fillColor = UIColor.white.cgColor
        let animate = CABasicAnimation(keyPath: "strokeEnd")
        animate.fromValue = 0
        animate.toValue = 1
        animate.duration = 6.0
        animate.isRemovedOnCompletion = false
        shaperlayer.add(animate, forKey: "")
        self.lineView.layer.addSublayer(shaperlayer)
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
            UIView.animate(withDuration: 0.5, animations: {
                self.beginIntroLabel.alpha = 1
            })
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
            UIView.animate(withDuration: 0.5, animations: {
                self.nowIntroLabel.alpha = 1
            })
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
            UIView.animate(withDuration: 0.5, animations: {
                self.endIntroLabel.alpha = 1
            })
        }
        
    }
    
    //设置数字动画
    func setupDaysView() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH-mm-ss"
        self.beginDate = formatter.date(from: self.beginTime)
        self.futureDate = formatter.date(from: self.futureTime)
        let endDate = Date()
        let time = self.numberOfDaysWithDate(self.beginDate, endDate: endDate,second: true)
        
        self.dayLabel.format = "%ld"
        self.dayLabel.count(from: 0, to: CGFloat(time.day), withDuration: 3.0)
        
        self.hourLabel.format = "%ld"
        self.hourLabel.count(from: 0, to: CGFloat(time.hour), withDuration: 4.0)
        
        self.minuteLabel.format = "%ld"
        self.minuteLabel.count(from: 0, to: CGFloat(time.minute), withDuration: 5.0)
        
        self.secondLabel.format = "%ld"
        self.secondLabel.count(from: 0, to: CGFloat(time.second+6), withDuration: 6.0)
        
        let allDay = self.numberOfDaysWithDate(self.beginDate, endDate: self.futureDate,second: false)
        let pro = CGFloat(time.day)/CGFloat(allDay.day)
        let proper = (1-pro)*100
        self.remainLabel.text = String(format:"%0.2f",proper) + "%"
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+6.0) {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.repeatNumberOfDays), userInfo: nil, repeats: true)
            self.timer.fire()
        }
    }
    
    //计算两个日期相差的天数
    func numberOfDaysWithDate(_ beginDate: Date, endDate: Date, second: Bool) -> (day:Int,hour:Int, minute:Int,second:Double) {
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.chinese)
        let comS = calendar?.components(NSCalendar.Unit.second, from: beginDate, to: endDate, options: NSCalendar.Options.wrapComponents)
        let comM = calendar?.components(NSCalendar.Unit.minute, from: beginDate, to: endDate, options: NSCalendar.Options.wrapComponents)
        let comH = calendar?.components(NSCalendar.Unit.hour, from: beginDate, to: endDate, options: NSCalendar.Options.wrapComponents)
        let comD = calendar?.components(NSCalendar.Unit.day, from: beginDate, to: endDate, options: NSCalendar.Options.wrapComponents)
        let day:Int = Int((comD?.day)!)
        let hour:Int = Int((comH?.hour)!)
        let minute:Int = Int((comM?.minute)!)
        if second == true {
            let second:Double = Double((comS?.second)!)
            return (day,hour,minute,second)
        }
        return (day,hour,minute,0)
    }
    
    //timer
    @objc func repeatNumberOfDays() ->Void {
        let time = self.numberOfDaysWithDate(self.beginDate, endDate: Date(),second: true)
        DispatchQueue.main.async {
            self.dayLabel.countFromCurrentValue(to: CGFloat(time.day))
            self.hourLabel.countFromCurrentValue(to: CGFloat(time.hour))
            self.minuteLabel.countFromCurrentValue(to: CGFloat(time.minute))
            self.secondLabel.countFromCurrentValue(to: CGFloat(time.second))
        }
    }
    
    deinit {
        self.timer.invalidate()
        self.timer = nil
    }
}
