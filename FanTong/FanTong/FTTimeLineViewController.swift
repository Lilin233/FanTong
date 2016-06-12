//
//  FTStatusTimeLineViewController.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/19.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit
import TDOAuth
class FTTimeLineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FanFouParamsFormatable, FTStatusCellDelegate {
    
    var layouts: [FTStatusLayout]? = []
    var status: [Status]? = []
    var timelineTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        requestData()
        addTableView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Add SubViews
    func addTableView(){
        timelineTableView = UITableView(frame: view.bounds, style: .Plain)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        view.addSubview(timelineTableView)
    }
    func addRefreshView(){
//        let header = mjchibao
    }
    //MARK: - NetWork
    func requestData(){
        let urlString2 = self.formatURLString(Constant.FanouURL.STATUSES_HOME_TIMELINE.rawValue, params: nil)
        NetWorkingManager.shareInstance.requestData(.GET, urlString: urlString2) { (data) -> () in
            let array = try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            for i in 0..<array.count{
                let status = Status.yy_modelWithJSON(array[i])
                let layout = FTStatusLayout(status: status!)
                self.layouts?.append(layout)
            }
            self.timelineTableView.reloadData()
        }
    }
    func statusUpdate(arrayParams: Array<String>, dicParams: NSDictionary, strParams: String){
        let params = self.formatPostParamsString(Constant.FanouURL.STATUSES_UPDATE.rawValue, params: arrayParams, dicParams: dicParams, strParams: strParams)
//        NetWorkingManager.shareInstance.requestData(.POST, params:params, urlString: Constant.FanouURL.STATUSES_UPDATE.rawValue) { (data) -> () in
//            let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
//            print(result)
//        }
        NetWorkingManager.shareInstance.updateStatus(Constant.FanouURL.STATUSES_UPDATE.rawValue, params: params)

    }
    //MARK: - TableView Datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let layouts = layouts{
            return layouts.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let identifier = "cellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? FTTimelineTableViewCell
        if cell == nil{
            cell = FTTimelineTableViewCell(style: .Default, reuseIdentifier: identifier)
        }else{
            for view in (cell?.statusView.subviews)! {
                if view.tag == 10001 {
                    view.removeFromSuperview()
                }
            }
        }
        cell?.layout = self.layouts![indexPath.row]
        cell?.delegate = self
        
        return cell! as UITableViewCell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return layouts![indexPath.row].height
    }
    
    //MARK: - FTStatusCellDelegate
    func repostButtonClick(cell: FTTimelineTableViewCell) {
        print(("id-------------") + cell.layout.status.id);
    }
    func repeatButtonClick(cell: FTTimelineTableViewCell) {
//        print(("id-------------") + cell.layout.status.id);
//        statusUpdate(["status=\("ft".encodeStringURL())", "repost_status_id=\(cell.layout.status.id.encodeStringURL())"], dicParams: NSDictionary.init(objects: ["ft", cell.layout.status.id], forKeys: ["status", "repost_status_id"]), strParams: "repost_status_id=\(cell.layout.status.id)&status=ft")
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 3
        configuration.timeoutIntervalForResource = 3
        let URLSession = NSURLSession(configuration: configuration)
        
        let  URLRequest = TDOAuth.URLRequestForPath("/statuses/update.json", parameters: NSDictionary.init(objects: ["ft", cell.layout.status.id], forKeys: ["status", "repost_status_id"]) as [NSObject : AnyObject], host: "api.fanfou.com", consumerKey: Constant.FanfouAPPKey.OAUTH_CONSUMER_KEY.rawValue, consumerSecret: Constant.FanfouAPPKey.OAUTH_CONSUMER_SECRET.rawValue, accessToken: NSUserDefaults.standardUserDefaults().valueForKey("oauth_token")!.componentsSeparatedByString("=").last!, tokenSecret: ((NSUserDefaults.standardUserDefaults().valueForKey("oauth_token_secret") as! String).componentsSeparatedByString("=").last)!, scheme: "http", requestMethod: "POST", dataEncoding: .UrlEncodedForm, headerValues: nil, signatureMethod: .HmacSha1)
            
//            [[TDOAuth URLRequestForPath:path parameters:parametersDictionary host:SA_API_HOST consumerKey:SA_API_COMSUMER_KEY consumerSecret:SA_API_COMSUMER_SECRET accessToken:currentUser.token tokenSecret:currentUser.tokenSecret scheme:@"http" requestMethod:method dataEncoding:TDOAuthContentTypeUrlEncodedForm headerValues:nil signatureMethod:TDOAuthSignatureMethodHmacSha1] mutableCopy];

       let task =  URLSession.dataTaskWithRequest(URLRequest) { (data, reponse, error) in
          print("1111111111111111111111111111")
            if (error != nil){
                print(error)
            }else{
                print(try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments))
            }
        }
    
        task.resume()
    
    }
    func likeButtonClick(cell: FTTimelineTableViewCell) {
        print(("id-------------") + cell.layout.status.id);
    }
}
