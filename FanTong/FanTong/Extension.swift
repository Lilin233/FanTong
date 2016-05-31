//
//  Extension.swift
//  FanTong
//
//  Created by liuk on 16/3/10.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import Foundation
import UIKit
extension String{
    func encodeStringURL() -> String{
        return CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, self, nil, ":&=;+!@#$()',*/", CFStringBuiltInEncodings.UTF8.rawValue) as String
    
    }
    
    func k_substringFromIndex(index:Int)->String{
        let startIndex = self.startIndex.advancedBy(index)
        return self.substringFromIndex(startIndex)
    }
    
    func k_substringEndIndex(index:Int)->String{
        let endIndex = self.endIndex.advancedBy(index)
        return self.substringToIndex(endIndex)
    }
//    func k_substringWithRange(start:Int, length: Int){
//        let range = Range(start: self.startIndex.advancedBy(startIndex), end: self.startIndex.advancedBy(length))
//        return self.substringWithRange(range)
//    }
}

extension UIView{
    var width : CGFloat{
        return self.frame.size.width
    }
    var height : CGFloat{
        return self.frame.size.height
    }
    var top : CGFloat{
        return self.frame.origin.y
    }
    var right : CGFloat{
        return self.frame.origin.x + self.frame.size.width
    }
    var bottom : CGFloat{
        return self.frame.origin.y + self.frame.size.height
    }
    var left : CGFloat{
        return self.frame.origin.x
    }
    
    func setWidth(width: CGFloat){
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
    }
    func setHeight(height: CGFloat){
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
    func setOrigin(origin: CGPoint){
        var frame = self.frame
        frame.origin = origin
        self.frame = frame
    }
    func setSize(size: CGSize){
        var frame = self.frame
        frame.size = size
        self.frame = frame
    }
    func setLeft(left: CGFloat){
        var frame = self.frame
        frame.origin.x = left
        self.frame = frame
    }
}
