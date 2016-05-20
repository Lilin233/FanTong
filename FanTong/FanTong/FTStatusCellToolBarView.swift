//
//  FTStatusCellToolBarView.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/20.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit

class FTStatusCellToolBarView: UIView {
    var cell: FTTimelineTableViewCell?
    var repostButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        addRepostButton()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Add SubViews
    func addRepostButton(){
        repostButton = UIButton(frame: self.bounds)
        repostButton.setTitle("转发", forState: .Normal)
        repostButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        repostButton.backgroundColor = UIColor.blackColor()
        repostButton.addTarget(self, action: "repostButtonClick", forControlEvents: .TouchUpInside)
        addSubview(repostButton)
    }

    //MARK: - Actions
    func repostButtonClick(){
        if cell?.delegate is FTStatusTimeLineViewController{
            cell?.delegate?.repostButtonClick(cell!)
        
        }
    }
}
