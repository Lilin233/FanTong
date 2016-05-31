//
//  FTLoginViewController.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/27.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit
import AFNetworking
class FTLoginViewController: FTBaseViewController, FanFouParamsFormatable {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.enabled = false
        _ = usernameTextField.rx_text.subscribeNext({ (str) in
            if str.characters.count > 0{
                self.loginButton.enabled = true
            }else{
                self.loginButton.enabled = false

            }
        })
        _ = pwdTextField.rx_text.subscribeNext({ (str) in
            if str.characters.count > 0{
                self.loginButton.enabled = true
            }else{
                self.loginButton.enabled = false
                
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func loginFanTong(sender: AnyObject) {
        
        let url = self.formatURLString(Constant.FanouURL.ACCESS_TOKEN_URL.rawValue, params: ["x_auth_username=\(usernameTextField.text)", "x_auth_password=\(pwdTextField.text)", "x_auth_mode=client_auth"])
        NetWorkingManager.shareInstance.requestData(.GET, urlString: url) { (data) in
            let token = NSString(data: data, encoding: NSUTF8StringEncoding)
            let tokenArray = token?.componentsSeparatedByString("&")
            NSUserDefaults.standardUserDefaults().setValue(tokenArray?.first, forKey: "oauth_token")
            NSUserDefaults.standardUserDefaults().setValue(tokenArray?.last, forKey: "oauth_token_secret")
            NSUserDefaults.standardUserDefaults().synchronize()
            print(token)
        }
    }

}
