//
//  ViewController.swift
//  FanTong
//
//  Created by liuk on 16/3/10.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//
let KRequestTokenURL = "http://fanfou.com/oauth/request_token"
let kAccessTokenURL = "http://fanfou.com/oauth/access_token"
let kFriendURL = "http://api.fanfou.com/friends/ids.json"
let kAuthorize = "http://m.fanfou.com/oauth/authorize"
let kApiKey = "c363d2d5b25fb7fe3e8d8e768eab5acf"
let kApiSecret = "ed4ff2f46b72ba3390739765c499e100&"
let kSecret = "ed4ff2f46b72ba3390739765c499e100&4fa31e744ee19ffb64bdfd1086c24c47"
import UIKit
class ViewController: UIViewController,FanFouParamsFormatable {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let urlString2 = self.formatURLString(Constant.FanouURL.STATUSES_HOME_TIMELINE.rawValue, params: nil)
//        NetWorkingManager.shareInstance.requestData(.GET, urlString: urlString2) { (data) -> () in
//            let array = try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
//            let status = Status.yy_modelWithJSON(array[0])
//            print(status)
//        }
        let tap = UITapGestureRecognizer(target: self, action: "tap")
        view.addGestureRecognizer(tap)
    }
    func tap(){
        self.presentViewController(FTStatusTimeLineViewController(), animated: true) { () -> Void in
            
        }
    }
    
    
    
    func random() ->UInt32{
      return  (arc4random() % 1000001) + UInt32(9999999)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    -//            let timestamp = self.timestamp()
//    -//            let nonce = self.random()
//    -//            //把参数按key得顺序排列
//    -//            let parm = "oauth_consumer_key=\(kApiKey)&oauth_nonce=\(nonce)&oauth_signature_method=HMAC-SHA1&oauth_timestamp=\(timestamp)&x_auth_mode=client_auth&x_auth_password=123456&x_auth_username=1002351468@qq.com"
//    -//            print(parm.encodeStringURL())
//    -//            //将URL和排序好的参数进行encode
//    -////            let baseString = "GET&\(kAccessTokenURL.encodeStringURL())&\(parm.encodeStringURL())&1002351468@qq.com&123456&client_auth"
//    -//        let baseString = "GET&\(kAccessTokenURL.encodeStringURL())&\(parm.encodeStringURL())"
//    -//
//    -//            //let hash3 = HmacSha1.hmacSha1(kApiSecret, text: baseString)
//    -//            //对baseString进行HmacSha1加密 使用base64位方式，在secret后添加一个&
//    -//            let hash3 = HmacSha1.hmacsha1Base64(kApiSecret, text: baseString)
//    -//
//    -//            //拼接所有参数
//    -//
//    -//            let urlString = "\(Constant.FanouURL.ACCESS_TOKEN_URL.rawValue)?oauth_consumer_key=\(kApiKey)&oauth_signature_method=HMAC-SHA1&oauth_signature=\(hash3)&oauth_timestamp=\(timestamp)&oauth_nonce=\(nonce)&x_auth_username=1002351468@qq.com&x_auth_password=123456&x_auth_mode=client_auth"
//    -
//    -        let urlString = self.loginURLString(Constant.FanouURL.ACCESS_TOKEN_URL.rawValue, params: ["x_auth_mode=client_auth", "x_auth_password=123456", "x_auth_username=1002351468@qq.com"])
//    -            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), { () -> Void in
//    -                NetWorkingManager.shareInstance.requestData(urlString, complete: { (result) -> () in
//    -                    print(result)
//    -//                    oauth_token=1236361-c4109ec68292f0050a2ed3cb30300cac&oauth_token_secret=4fa31e744ee19ffb64bdfd1086c24c47
//    -//                    let nonce2 = self.random()
//    -//                    let timestamp2 = Int(NSDate().timeIntervalSince1970)
//    -
//    -//                    let parm = "oauth_consumer_key=\(kApiKey)&oauth_nonce=\(nonce)&oauth_signature_method=HMAC-SHA1&oauth_timestamp=\(timestamp)&oauth_token=1236361-c4109ec68292f0050a2ed3cb30300cac";
//    -//
//    -//                    let baseString = "GET&\(kFriendURL.encodeStringURL())&\(parm.encodeStringURL())"
//    -//                    let hash3 = HmacSha1.hmacsha1Base64(kSecret, text: baseString)
//    -//                    print(baseString);
//    -//                    let urlString = "\(kFriendURL)?oauth_consumer_key=\(kApiKey)&oauth_nonce=\(nonce)&oauth_signature_method=HMAC-SHA1&oauth_signature=\(hash3)&oauth_timestamp=\(timestamp)&oauth_token=1236361-c4109ec68292f0050a2ed3cb30300cac"
//    -//
//    -//                    NetWorkingManager.shareInstance.requestData(urlString, complete: { (result) -> () in
//    -//                        print(result)
//    -//
//    -//
//    -//                    })
//    -
//    -                })
//    -            })
//    -
//    -
//    
//    -
//    -//        //采用当前时间到1970年时间戳，不需要修改失去
//    -//        let timestamp = Int(NSDate().timeIntervalSince1970)
//    -//
//    -//        let nonce = random()
//    -//        //把参数按key得顺序排列
//    -//        let parm = "oauth_consumer_key=\(kApiKey)&oauth_nonce=\(nonce)&oauth_signature_method=HMAC-SHA1&oauth_timestamp=\(timestamp)"
//    -//
//    -//        //将URL和排序好的参数进行encode
//    -//        let baseString = "GET&\(KRequestTokenURL.encodeStringURL())&\(parm.encodeStringURL())"
//    -//
//    -//        //let hash3 = HmacSha1.hmacSha1(kApiSecret, text: baseString)
//    -//        //对baseString进行HmacSha1加密 使用base64位方式，在secret后添加一个&
//    -//        let hash3 = HmacSha1.hmacsha1Base64(kApiSecret, text: baseString)
//    -//
//    -//        //拼接所有参数
//    -//
//    -//        let urlString = "\(KRequestTokenURL)?oauth_consumer_key=\(kApiKey)&oauth_signature_method=HMAC-SHA1&oauth_signature=\(hash3)&oauth_timestamp=\(timestamp)&oauth_nonce=\(nonce)"
//    -//
//    -//        //返回request token & secret
//    -//        NetWorkingManager.shareInstance.requestData(urlString) { (result) -> () in
//    -////            print(result)
//    -//            let token =  result.componentsSeparatedByString("&").first?.componentsSeparatedByString("=").last
//    -//
//    -//            let authURL = "\(kAuthorize)?oauth_token=\(token!)&oauth_callback=oob"
//    -//            UIApplication.sharedApplication().openURL(NSURL(string: authURL)!)
//    -//
//    -//
//    -//
//    -//
//    -//            let timestamp = Int(NSDate().timeIntervalSince1970)
//    -//            let nonce = self.random()
//    -//
//    -//            //把参数按key得顺序排列
//    -//            let parm = "oauth_consumer_key=\(kApiKey)&oauth_nonce=\(nonce)&oauth_signature_method=HMAC-SHA1&oauth_timestamp=\(timestamp)&oauth_token=\(token!)"
//    -////            print(parm)
//    -//            print(parm.encodeStringURL())
//    -//            //将URL和排序好的参数进行encode
//    -//            let baseString = "GET&\(kAccessTokenURL.encodeStringURL())&\(parm.encodeStringURL())"
//    -//
//    -//            //let hash3 = HmacSha1.hmacSha1(kApiSecret, text: baseString)
//    -//            //对baseString进行HmacSha1加密 使用base64位方式，在secret后添加一个&
//    -//            let hash3 = HmacSha1.hmacsha1Base64(kApiSecret, text: baseString)
//    -//
//    -//            //拼接所有参数
//    -//
//    -//            let urlString = "\(kAccessTokenURL)?oauth_consumer_key=\(kApiKey)&oauth_token=\(token!)&oauth_signature_method=HMAC-SHA1&oauth_signature=\(hash3)&oauth_timestamp=\(timestamp)&oauth_nonce=\(nonce)"
//    -//
//    -//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), { () -> Void in
//    -//                NetWorkingManager.shareInstance.requestData(urlString, complete: { (result) -> () in
//    -//                    print(result)
//    -//
//    -//            })
//    -//            })
//    -//            
//    -//            
//    -//            
//    -//            
//    -//            
//    -//            
//    -//            
//    -//            
//    -//            
//    -//
    

}

