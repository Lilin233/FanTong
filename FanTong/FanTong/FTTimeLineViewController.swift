//
//  FTStatusTimeLineViewController.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/19.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit
import TDOAuth
class FTTimeLineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FanFouParamsFormatable, FTStatusCellDelegate, UIActionSheetDelegate {
    
    var layouts: [FTStatusLayout]? = []
    var status: [Status]? = []
    var timelineTableView: UITableView!
    var currentStatus: Status!
    var actionSheet: UIActionSheet!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        requestData()
        addTableView()
        addRefreshHeaderView()

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
    func addActionSheet(){
        actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "转发", "引用")
        actionSheet.showInView(self.view)
    }
    func addRefreshHeaderView(){
        let headerView = MJChiBaoZiHeader(refreshingTarget: self, refreshingAction: #selector(FTTimeLineViewController.requestData))
        timelineTableView.mj_header = headerView
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
            self.timelineTableView.mj_header.endRefreshing()
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
    func replyButtonClick(cell: FTTimelineTableViewCell) {
        self.updateStatus(StatusUpdateType.replyStatus)
        self.currentStatus = cell.layout.status
    }
    func repostButtonClick(cell: FTTimelineTableViewCell) {
        self.currentStatus = cell.layout.status
        addActionSheet()
    }
    func likeButtonClick(cell: FTTimelineTableViewCell) {
        print(("id-------------") + cell.layout.status.id);
    }
    
    func updateStatus(updateType: StatusUpdateType){
        let vc = FTUpdateStatusViewController()
        vc.status = currentStatus
        vc.updateType = updateType
        self.presentViewController(vc, animated: true) { 
            
        }
    }
    //MARK: - ActionSheet Delegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1{
            self.updateStatus(StatusUpdateType.repostStatus)

        }else if buttonIndex == 2{
            self.updateStatus(StatusUpdateType.quoteStatus)

        }
    }

}
