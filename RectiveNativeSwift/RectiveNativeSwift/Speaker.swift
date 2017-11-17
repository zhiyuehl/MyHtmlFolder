//
//  Speaker.swift
//  RectiveNativeSwift
//
//  Created by tederen on 2017/10/31.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit

struct Speaker {
    let name: String
    let twitterHandle: String
    var image: UIImage?
    
    init(name: String, twitterHandle: String) {
        self.name = name
        self.twitterHandle = twitterHandle
        self.image = UIImage(named: name)
    }
}


extension Speaker: CustomStringConvertible {
    var description: String {
        return "\(name) \(twitterHandle)"
    }
}
