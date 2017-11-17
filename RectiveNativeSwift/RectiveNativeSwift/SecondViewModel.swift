//
//  SecondViewModel.swift
//  RectiveNativeSwift
//
//  Created by tederen on 2017/11/3.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit
import Alamofire



class SecondViewModel: NSObject {

    
    
    
    class func requestData() {
        let para: Parameters = ["a":234]
        
        Alamofire.request("http://api.tederen.com/query/recommend/teacher",method:.get,parameters:para).responseJSON { (response) in
            
        }
    }
    
}
