//
//  ViewModel.swift
//  RectiveNativeSwift
//
//  Created by tederen on 2017/10/31.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import Foundation
import RxSwift

struct SpeakerListViewModel {
    //将data的属性编程一个可观察序列对象(Observable Sqquence)，序列可以对这些数值进行订阅(Subscribe)，就如同 NSNotificaitonCenter 的概念差不多。
    let data = Observable.just([
        Speaker(name: "Aqqq", twitterHandle: "@jjjj"),
        Speaker(name: "Bwww", twitterHandle: "@kkkk"),
        Speaker(name: "Cjjj", twitterHandle: "@4fjjf"),
        Speaker(name: "Djjkki", twitterHandle: "@jfeiwal"),
        Speaker(name: "Enijew", twitterHandle: "@eaowe"),
        Speaker(name: "Fjleija", twitterHandle: "@fjelafi")
    ])
}
