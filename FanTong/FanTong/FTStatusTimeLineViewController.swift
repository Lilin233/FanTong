//
//  FTStatusTimeLineViewController.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/19.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit

class FTStatusTimeLineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FanFouParamsFormatable {
    
    var layouts: [FTStatusLayout]? = []
    var status: [Status]? = []
    var timelineTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        addTableView()
    }
    
    //MARK: - Add SubViews
    func addTableView(){
        timelineTableView = UITableView(frame: view.bounds, style: .Plain)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        view.addSubview(timelineTableView)
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
    //MARK: - TableView Datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let layouts = layouts{
            return layouts.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let identifier = "cellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil{
            cell = FTTimelineTableViewCell(style: .Default, reuseIdentifier: identifier) as UITableViewCell
        }
        (cell as! FTTimelineTableViewCell).layout = layouts![indexPath.row]
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return layouts![indexPath.row].height
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
