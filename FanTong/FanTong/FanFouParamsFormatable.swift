//
//  FanFouParamsFormatable.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/13.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import Foundation

///饭否接口格式化参数
protocol FanFouParamsFormatable{
    func timestamp() -> Int
    func nonceRandom() -> UInt32
    func oauthBaseParams(urlString: String) -> Array<String>
    func oauthBaseParamsSplitString(urlString: String, params: Array<String>?) -> String
    func oauthSignature(methodType: String, urlString:String, paramsString: String) -> String
    func formatURLString(urlString: String, params: Array<String>?) -> String
}
extension FanFouParamsFormatable{
    func timestamp() -> Int{
        return Int(NSDate().timeIntervalSince1970)
    }
    func nonceRandom() -> UInt32{
        return  (arc4random() % 1000001) + UInt32(9999999)

    }
    func oauthBaseParams(urlString: String) -> Array<String>{
        if urlString == Constant.FanouURL.ACCESS_TOKEN_URL.rawValue{
            return ["oauth_consumer_key=\(Constant.FanfouAPPKey.OAUTH_CONSUMER_KEY.rawValue)",
                "oauth_nonce=\(self.nonceRandom())",
                "oauth_signature_method=HMAC-SHA1",
                "oauth_timestamp=\(self.timestamp())"]
        }else{
            return ["oauth_consumer_key=\(Constant.FanfouAPPKey.OAUTH_CONSUMER_KEY.rawValue)",
                "oauth_nonce=\(self.nonceRandom())",
                "oauth_signature_method=HMAC-SHA1",
                "oauth_timestamp=\(self.timestamp())",
                NSUserDefaults.standardUserDefaults().valueForKey("oauth_token") as! String]

        }
    }
    func oauthBaseParamsSplitString(urlString: String, params: Array<String>?) -> String{
        var baseParams = self.oauthBaseParams(urlString)
        if let params = params{
            baseParams.appendContentsOf(params)

        }
        let paramsString = baseParams.sort{
            $0 < $1
            }.reduce(""){
                $0 + "&" + $1
        }
        return paramsString
    }
    func oauthSignature(methodType: String, urlString:String, paramsString: String) -> String{
        let params = paramsString.k_substringFromIndex(1)
        let baseString = methodType + "&" + urlString.encodeStringURL() + "&" + params.encodeStringURL()
        var secret = ""
        if urlString == Constant.FanouURL.ACCESS_TOKEN_URL.rawValue{
            secret = Constant.FanfouAPPKey.OAUTH_CONSUMER_SECRET.rawValue + "&"
        }else{
            secret = Constant.FanfouAPPKey.OAUTH_CONSUMER_SECRET.rawValue + "&" + ((NSUserDefaults.standardUserDefaults().valueForKey("oauth_token_secret") as! String).componentsSeparatedByString("=").last)!

        }
        let hash3 = HmacSha1.hmacsha1Base64(secret, text: baseString)
        return hash3
    }
    func formatURLString(urlString: String, params: Array<String>?) -> String{
        //拼接参数
        var sortParams = self.oauthBaseParamsSplitString(urlString, params: params)
        //获取参数的signature
        var signature = self.oauthSignature("GET", urlString: urlString, paramsString: sortParams)
        //替换 "+", "/"符号
        signature = signature.stringByReplacingOccurrencesOfString("+", withString: "%2B")
        signature = signature.stringByReplacingOccurrencesOfString("/", withString: "%2F")

        //signature拼接到参数中
        sortParams = sortParams + "&oauth_signature=\(signature)"
        return urlString + "?" + sortParams.k_substringFromIndex(1)

    }


}