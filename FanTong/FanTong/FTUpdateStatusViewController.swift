//
//  FTUpdateStatusViewController.swift
//  FanTong
//
//  Created by liuk on 16/6/11.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit

class FTUpdateStatusViewController: UIViewController, UpdateStatusDelegate {
    var updateStatusView: FTUpdateStatus!
    var status: Status?
    var updateType: StatusUpdateType!
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    //MARK: Add SubViews
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func addSubViews(){
        updateStatusView = FTUpdateStatus(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        updateStatusView.delegate = self
        view.addSubview(updateStatusView)
        if let status = self.status{
            if updateType == StatusUpdateType.replyStatus{
                updateStatusView.textView.text = "@" + status.user.name + " "

            }else if updateType == StatusUpdateType.quoteStatus{
                updateStatusView.textView.text = "转" + status.text
                updateStatusView.textView.selectedRange = NSMakeRange(0, 0)

            }
        }
    }
    //MARK: - Private
    func statusUpdate(path: String, params: NSDictionary){
        NetWorkingManager.shareInstance.requestData(.POST, params:params, urlString: path) { (data) -> () in
            let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            print(result)
        }
        
    }

    //MARK: - UpdateStatusDelegate
    func cancelUpdate() {
        self.dismissViewControllerAnimated(true) { 
            
        }
    }
    func send() {
        var statusText: String = ""
        if updateType == StatusUpdateType.repostStatus{
            statusText = "转" + (status?.text)!;
        }else if updateType == StatusUpdateType.quoteStatus{
            statusText = "转" + (status?.text)!;

        }
        self.statusUpdate(Constant.FanouURL.STATUSES_UPDATE.rawValue, params: ["status": updateStatusView.textView.text, "in_reply_to_status_id": status!.id, "lite": "mode", "html": "format"])

    }

    
}
