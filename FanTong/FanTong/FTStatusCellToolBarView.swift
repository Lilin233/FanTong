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
    var repeatButton: UIButton!
    var likeButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        addRepostButton()
        addRepeatButton()
        addLikeButton()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Add SubViews
    func addRepostButton(){
        repostButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.width / 3, height: self.height))
        repostButton.setTitle("回复", forState: .Normal)
        repostButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        repostButton.addTarget(self, action: #selector(FTStatusCellToolBarView.repostButtonClick), forControlEvents: .TouchUpInside)
        repostButton.titleLabel?.font = UIFont.systemFontOfSize(14.0)
        addSubview(repostButton)
    }
    func addRepeatButton(){
        repeatButton = UIButton(frame: CGRect(x: self.width / 3, y: 0, width: self.width / 3, height: self.height))
        repeatButton.setTitle("转发", forState: .Normal)
        repeatButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        repeatButton.addTarget(self, action: #selector(FTStatusCellToolBarView.repeatButtonClick), forControlEvents: .TouchUpInside)
        repeatButton.titleLabel?.font = UIFont.systemFontOfSize(14.0)

        addSubview(repeatButton)
    }
    func addLikeButton(){
        likeButton = UIButton(frame: CGRect(x: self.width / 3 * 2, y: 0, width: self.width / 3, height: self.height))
        likeButton.setTitle("收藏", forState: .Normal)
        likeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        likeButton.addTarget(self, action: #selector(FTStatusCellToolBarView.likeButtonClick), forControlEvents: .TouchUpInside)
        likeButton.titleLabel?.font = UIFont.systemFontOfSize(14.0)

        addSubview(likeButton)
    }

    //MARK: - Actions
    func repostButtonClick(){
        if cell?.delegate is FTTimeLineViewController{
            cell?.delegate?.repostButtonClick(cell!)
        
        }
    }
    func repeatButtonClick(){
        if cell?.delegate is FTTimeLineViewController{
            cell?.delegate?.repeatButtonClick(cell!)
            
        }
    }

    func likeButtonClick(){
        if cell?.delegate is FTTimeLineViewController{
            cell?.delegate?.likeButtonClick(cell!)
            
        }
    }

}
