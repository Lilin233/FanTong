//
//  Extension.swift
//  FanTong
//
//  Created by liuk on 16/3/10.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import Foundation
extension String{
    func encodeStringURL() -> String{
      
        return CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, self, nil, ":&=;+!@#$()',*/", CFStringBuiltInEncodings.UTF8.rawValue) as String
    
    }
    
    
}