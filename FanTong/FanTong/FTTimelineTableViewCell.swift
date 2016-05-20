//
//  FTTimelineTableViewCell.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/20.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit

class FTTimelineTableViewCell: UITableViewCell {
    var statusView: FTStatusCellView!
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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MAKR: - Add SubViews
    func addStatusView(){
        statusView = FTStatusCellView(frame: self.contentView.bounds)
        statusView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        contentView.addSubview(statusView)
    }
}
