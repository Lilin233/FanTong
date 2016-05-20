//
//  FTStatusLayout.swift
//  FanTong
//
//  Created by Kai Liu on 16/5/19.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit

class FTStatusLayout: NSObject {
    /// 总高度
    var height: CGFloat = 0
    ///内容高度
    var textHeight: CGFloat = 0
    /// 图片高度 没有图片时候高度为0
    let statusImageHeihgt: CGFloat = 0
    var status: Status!
    private override init() {
        super.init()
    }
    convenience init(status: Status) {
        self.init()
        self.status = status
        layout()
    }
    
    func layout(){
        layoutStatusText()
        //累加cell中元素的高度
        height += kStatusCellTopMargin
        height += kStatusCellTitleHeight
        height += kStatusCellTextPadding
        height += textHeight
        height += statusImageHeihgt
        height += kStatusCellTextPadding
        height += kStatusCellToolbarHeight
    }
    /// 计算一条 Status 的 text 高度
    func layoutStatusText(){
        let textRect = (self.status.text as NSString).boundingRectWithSize(CGSize(width: kStatusCellTextWidth, height: CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : kStatusCellTextFont], context: nil)
        textHeight = textRect.size.height
    }
}
