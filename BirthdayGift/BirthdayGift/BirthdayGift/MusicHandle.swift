//
//  MusicHandle.swift
//  BirthdayGift
//
//  Created by tederen on 2017/10/24.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit
import AVFoundation

class MusicHandle: NSObject,AVAudioPlayerDelegate {
    
    static let shareMusicHandle = MusicHandle()
    
    var musicIndex: Int = 0
    let musicArray: Array = ["小蓓蕾组合 - 祝你生日快乐","云雀合唱团 - 祝你生日快乐","刘若英 - 生日快乐","温岚,周杰伦 - 祝我生日快乐","陈一发儿 - 童话镇"]
    
    var musicPlayer: AVAudioPlayer!
    
    public func play(_ index: Int) {
        
        if index >= self.musicArray.count {
            self.musicIndex = 0
        }
        
        let path = Bundle.main.path(forResource: musicArray[self.musicIndex], ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        if let _ = self.musicPlayer {
            if self.musicPlayer.isPlaying == true {
                self.musicPlayer.stop()
            }
        }
        do {
            try self.musicPlayer = AVAudioPlayer(contentsOf: url)
            self.musicPlayer.prepareToPlay()
            //设置音乐播放次数 -1为一直循环，直到stop，0为一次，1为2次，以此类推
            self.musicPlayer.numberOfLoops = 0
            self.musicPlayer.volume = 1
            self.musicPlayer.delegate = self
            self.musicPlayer.prepareToPlay()
        }catch {
            print(error)
        }
        self.musicPlayer.play()
    }
    
    
    private override init() {
        //必须有这个，否则没有声音
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback)
            try session.setActive(true)
        }catch {
            print(error)
        }
    }

    
}

extension MusicHandle {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.musicIndex += 1
        self.play(self.musicIndex)
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
    }
    
    
}
