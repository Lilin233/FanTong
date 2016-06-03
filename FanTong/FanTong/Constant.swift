//
//  Constant.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/13.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import Foundation
import UIKit
/// 屏幕宽度
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width

/// 屏幕高度
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

/// cell顶部留白
let kStatusCellTopMargin: CGFloat = 16

/// cell左右留白
let kStatusCellLeftMargin: CGFloat = 15

/// 标题高度
let kStatusCellTitleHeight: CGFloat = 30

/// 内容离着标题的留白
let kStatusCellTextPadding: CGFloat = 10

/// time source高度
let kStatusTimelabelHeight: CGFloat = 20

/// 头像宽度
let kStatusCellAvatarWidth: CGFloat = 50

/// text宽度
let kStatusCellTextWidth: CGFloat = SCREEN_WIDTH - kStatusCellTextPadding - kStatusCellLeftMargin * 2 - kStatusCellAvatarWidth
let kStatusImageHeihgt: CGFloat = 140


/// status cell toolbar height

let kStatusCellToolbarHeight: CGFloat = 22
//status字体，分别为text， title， time字体
let kStatusCellTextFont: UIFont = UIFont.systemFontOfSize(17)
let kStatusCellTitleFont: UIFont = UIFont.boldSystemFontOfSize(17)
let kStatusCellTimeFont: UIFont = UIFont.systemFontOfSize(15)

let DETAIL_TEXT_COLOR: UIColor = UIColor(red: 0.600, green: 0.600, blue: 0.600, alpha: 1);

let BODY_COLOR: UIColor = UIColor(colorLiteralRed: 0.996, green: 1, blue: 1, alpha: 1)

public enum Constant{

    //饭否应用key和secret
    enum FanfouAPPKey: String{
        case OAUTH_CONSUMER_KEY = "c363d2d5b25fb7fe3e8d8e768eab5acf",
             OAUTH_CONSUMER_SECRET = "ed4ff2f46b72ba3390739765c499e100"
    }
    ///饭否接口URL
    enum FanouURL: String{
        case
            //OAUTH
            REQUEST_TOKEN_URL = "http://fanfou.com/oauth/request_token",
            ACCESS_TOKEN_URL = "http://fanfou.com/oauth/access_token",
            FRIENDS_IDS = "http://api.fanfou.com/friends/ids.json",
            CONTEXT_TIMELINE = "http://api.fanfou.com/statuses/context_timeline.json",
        
            //USERS
            USERS_SHOW = "http://api.fanfou.com/users/show.json",
        
            //Statuses
            STATUSES_HOME_TIMELINE = "http://api.fanfou.com/statuses/home_timeline.json"

    }
    
    
    
}