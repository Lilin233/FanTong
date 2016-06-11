//
//  FTTimelineTableViewCell.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/20.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit
protocol FTStatusCellDelegate{
    func replyButtonClick(cell: FTTimelineTableViewCell)
    func repostButtonClick(cell: FTTimelineTableViewCell)
    func likeButtonClick(cell: FTTimelineTableViewCell)

}

class FTTimelineTableViewCell: UITableViewCell {
    var statusView: FTStatusCellView!
    var delegate: FTStatusCellDelegate?
    var layout: FTStatusLayout!{
       didSet{
            self.setHeight(layout.height)
            self.contentView.setHeight(layout.height)
            statusView.layout = layout
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addStatusView()
        self.backgroundColor = BODY_COLOR;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MAKR: - Add SubViews
    func addStatusView(){
        statusView = FTStatusCellView(frame: self.contentView.bounds)
        statusView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        statusView.cell = self
        statusView.toolbar.cell = self
        contentView.addSubview(statusView)
    }
}
