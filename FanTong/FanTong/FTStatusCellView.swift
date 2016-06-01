//
//  FTStatusCellView.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/20.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit

class FTStatusCellView: UIView {

    var avatarView: UIImageView!
    var titleLabel: LKLabel!
    var textLabel: LKLabel!
    var timeLabel: LKLabel!
    var toolbar: FTStatusCellToolBarView!
    var cell: FTTimelineTableViewCell!
    var layout: FTStatusLayout!{
        didSet{
            self.setHeight(layout.height)
            layoutStatusTextLabel()
        }
    }
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Add SubViews
    func setupSubViews(){
        addAvatarView()
        addTitleView()
        addTextView()
        addTimeView()
        addToolbar()
    }
    func addAvatarView(){
        avatarView = UIImageView(frame: CGRect(x: kStatusCellLeftMargin, y: kStatusCellTopMargin, width: kStatusCellAvatarWidth, height: kStatusCellAvatarWidth))
        avatarView.layer.cornerRadius = 8
        avatarView.layer.masksToBounds = true
        addSubview(avatarView)
    }
    func addTitleView(){
        titleLabel = LKLabel(frame: CGRectMake(avatarView.right + kStatusCellTextPadding, kStatusCellTopMargin, kStatusCellTextWidth, kStatusCellTitleHeight), text: "", textColor: nil, font: kStatusCellTitleFont, textalignment: nil)
        addSubview(titleLabel)
    }
    func addTextView(){
        textLabel = LKLabel(frame: CGRectMake(avatarView.right + kStatusCellTextPadding, titleLabel.bottom + kStatusCellTextPadding, kStatusCellTextWidth, kStatusCellTitleHeight), text: "", textColor: nil, font: kStatusCellTextFont, textalignment: nil)
        textLabel.numberOfLines = 0
        addSubview(textLabel)
    }
    func addTimeView(){
        timeLabel = LKLabel(frame: CGRectMake(SCREEN_WIDTH - 100 - kStatusCellLeftMargin, kStatusCellTopMargin, 100, kStatusCellTitleHeight), text: "", textColor: nil, font: kStatusCellTimeFont, textalignment: NSTextAlignment.Right)
        timeLabel.autoresizingMask = .FlexibleTopMargin
        addSubview(timeLabel)
    }
    func addToolbar(){
        toolbar = FTStatusCellToolBarView(frame: CGRect(x: textLabel.left, y: self.height - kStatusCellToolbarHeight, width: kStatusCellTextWidth, height: kStatusCellToolbarHeight))
        toolbar.autoresizingMask = [.FlexibleTopMargin]
        addSubview(toolbar)
    }
    //MARK: - Private Method
    private func layoutStatusTextLabel(){
        textLabel.setHeight(self.layout.textHeight)
        titleLabel.text = self.layout.status.user.screen_name
        textLabel.text = self.layout.status.text
        avatarView.sd_setImageWithURL(NSURL.init(string: self.layout.status.user.profile_image_url_large))
    }
}
