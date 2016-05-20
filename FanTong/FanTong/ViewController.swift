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

    
    

}

