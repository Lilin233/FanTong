//
//  FTStatusCellView.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/20.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit

class FTStatusCellView: UIView {
    let imageViewCorner: CGFloat = 6
    var avatarView: UIImageView!
    var titleLabel: LKLabel!
    var textLabel: LKLabel!
    var timeLabel: LKLabel!
    var imageView: UIImageView!
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
        addTimeView()
        addTextView()
        addToolbar()
    }
    func addAvatarView(){
        avatarView = UIImageView(frame: CGRect(x: kStatusCellLeftMargin, y: kStatusCellTopMargin, width: kStatusCellAvatarWidth, height: kStatusCellAvatarWidth))
        avatarView.layer.cornerRadius = 8
        avatarView.layer.masksToBounds = true
        avatarView.layer.borderWidth = 1
        avatarView.layer.borderColor = UIColor.lightGrayColor().CGColor
        addSubview(avatarView)
    }
    func addTitleView(){
        titleLabel = LKLabel(frame: CGRectMake(avatarView.right + kStatusCellTextPadding, kStatusCellTopMargin, kStatusCellTextWidth, kStatusCellTitleHeight), text: "", textColor: nil, font: kStatusCellTitleFont, textalignment: nil)
        addSubview(titleLabel)
    }
    func addTimeView(){
        timeLabel = LKLabel(frame: CGRectMake(titleLabel.left, titleLabel.bottom, SCREEN_WIDTH - titleLabel.left, kStatusTimelabelHeight), text: "", textColor: nil, font: kStatusCellTimeFont, textalignment: NSTextAlignment.Right)
        timeLabel.font = kStatusCellTimeFont;
        timeLabel.textColor = DETAIL_TEXT_COLOR;
        addSubview(timeLabel)
    }

    func addTextView(){
        textLabel = LKLabel(frame: CGRectMake(avatarView.right + kStatusCellTextPadding, timeLabel.bottom + kStatusCellTextPadding, kStatusCellTextWidth, kStatusCellTitleHeight), text: "", textColor: nil, font: kStatusCellTextFont, textalignment: nil)
        textLabel.numberOfLines = 0
        addSubview(textLabel)
    }
    func addImageView(){
        imageView = UIImageView(frame: CGRect(x: titleLabel.left, y: textLabel.bottom + kStatusCellTextPadding, width: kStatusCellTextWidth, height: kStatusImageHeihgt))
        imageView.layer.masksToBounds = true;
        imageView.layer.cornerRadius = imageViewCorner;
        imageView.contentMode = .ScaleAspectFill
        imageView.tag = 10001;
        addSubview(imageView)
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
        timeLabel.text = self.layout.status.created_at.formatStatusTime() + " 来自" + self.layout.status.source.formatStatusSource()
//        timeLabel.text = self.layout.status.source.formatStatusSource()
        if layout.status.photo.imageurl.characters.count > 0 {
            self.addImageView()
            imageView.sd_setImageWithURL(NSURL.init(string: self.layout.status.photo.imageurl))
        }

    }
}
