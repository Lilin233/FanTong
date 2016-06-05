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
    
    func formatStatusSource() -> String{
        if self == "网页" {
            return self
        }
        var str = (self as NSString).stringByReplacingOccurrencesOfString("<", withString: "$")
        str = str.stringByReplacingOccurrencesOfString(">", withString: "$")
        let array = str.componentsSeparatedByString("$")
        return array[2]
    }
    func formatStatusTime() -> String{
        //一小时以内 显示 xx分钟以前
        //时间为当天 显示为 xx小时以前
        //昨天发的status 显示为 昨天xxx点，格式24h
        //昨天之前发的status 显示为 MM:dd
        //去年的status    显示为  yyyy-MM-dd
        let format = NSDateFormatter()
        format.dateFormat = "EEE MMM d HH:mm:ss zzzz yyyy"
        let locale = NSLocale(localeIdentifier: "en_US")
        format.locale = locale
        let date = format.dateFromString(self)
        
        var inter = date?.timeIntervalSinceNow;
        if inter < 0 {
            inter = -inter!
        }
        let dayInter = floor(inter! / 86400)
        let yestorday = floor(dayInter / 2)
        let days = Int(dayInter)
        let weaks = Int(ceil(dayInter / 7))
        let months = Int(ceil(dayInter / 30))
        let years = Int(ceil(dayInter / 365))
        
        if dayInter <= 0 {
            if inter < 60 {
                return "刚刚"
            }
            if inter < 120 {
                return "1分钟前"
            }
            if inter < 60 * 60 {
                return String(format:"%.0f", floor(inter! / 60)) + "分钟前"
            }
            if inter < 86400{
                return String(format:"%.0f", floor(inter! / 3600)) + "小时前"
            }
            
            
        } else if yestorday <= 0 {
            format.dateFormat = "HH:mm"
            return "昨天" + format.stringFromDate(date!)
        } else if months < 12  {
            format.dateFormat = "MM-dd"
            return (format.stringFromDate(date!) as NSString).stringByReplacingOccurrencesOfString("0", withString: "")

        }else {
            format.dateFormat = "yyyy-MM-d"

            return format.stringFromDate(date!)
            
        }
        return ""
    }
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
