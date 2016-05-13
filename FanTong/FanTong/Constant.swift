//
//  Constant.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/13.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import Foundation

///常量
public enum Constant{

    //饭否应用key和secret
    enum FanfouAPPKey: String{
        case OAUTH_CONSUMER_KEY = "c363d2d5b25fb7fe3e8d8e768eab5acf",
             OAUTH_CONSUMER_SECRET = "ed4ff2f46b72ba3390739765c499e100"
    }
    ///饭否接口URL
    enum FanouURL: String{
        case REQUEST_TOKEN_URL = "http://fanfou.com/oauth/request_token",
             ACCESS_TOKEN_URL = "http://fanfou.com/oauth/access_token",
             Friends_IDS = "http://api.fanfou.com/friends/ids.json"
    }
    
    
    
}