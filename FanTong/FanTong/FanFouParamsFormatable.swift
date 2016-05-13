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
    func oauthBaseParams() -> Array<String>
    func oauthBaseParamsSplitString(params: Array<String>) -> String
    func oauthSignature(methodType: String, urlString:String, paramsString: String) -> String
    func loginURLString(urlString: String, params: Array<String>) -> String
    
}
extension FanFouParamsFormatable{
    func timestamp() -> Int{
        return Int(NSDate().timeIntervalSince1970)
    }
    func nonceRandom() -> UInt32{
        return  (arc4random() % 1000001) + UInt32(9999999)

    }
    func oauthBaseParams() -> Array<String>{
        return ["oauth_consumer_key=\(Constant.FanfouAPPKey.OAUTH_CONSUMER_KEY.rawValue)",
                "oauth_nonce=\(self.nonceRandom())",
                "oauth_signature_method=HMAC-SHA1",
                "oauth_timestamp=\(self.timestamp())"]
    }
    func oauthBaseParamsSplitString(params: Array<String>) -> String{
        var baseParams = self .oauthBaseParams()
        baseParams.appendContentsOf(params)
        let paramsString = baseParams.sort{
            $0 < $1
            }.reduce(""){
                $0 + "&" + $1
        }
        return paramsString
    }
    func oauthSignature(methodType: String, urlString:String, paramsString: String) -> String{
        let baseString = methodType + urlString.encodeStringURL() + paramsString.encodeStringURL()
        let hash3 = HmacSha1.hmacsha1Base64(Constant.FanfouAPPKey.OAUTH_CONSUMER_SECRET.rawValue + "&", text: baseString)
        return hash3
    }
    func loginURLString(urlString: String, params: Array<String>) -> String{
        let signature = self.oauthSignature("GET", urlString: urlString, paramsString: self.oauthBaseParamsSplitString(params))
        var params = self.oauthBaseParamsSplitString(params)
        params = params + "&oauth_signature=\(signature)"
        let startIndex = params.startIndex.advancedBy(1)
        return urlString + "?" + params.substringFromIndex(startIndex)
    }


}