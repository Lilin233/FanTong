//
//  FTUpdateStatus.swift
//  FanTong
//
//  Created by liuk on 16/6/11.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit
import YYText
import Foundation
enum StatusUpdateType: String {
    case createStatus, replyStatus, repostStatus, quoteStatus
}
protocol UpdateStatusDelegate {
    func cancelUpdate()
    func send()
}
let kCancelButtonWidth: CGFloat = 80
let kCancelButtonHeight: CGFloat = 30
let kKeyBoardButtonWidth: CGFloat = 80
class FTUpdateStatus: UIView {
    var textView: YYTextView!
    var keyBoardTollBar: UIView!
    var closeButton: UIButton!
    var delegate: UpdateStatusDelegate!
    var sendButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    func initViews(){
        addSubViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Add SubViews
    func addSubViews(){
        addCloseButton()
        addTextView()
        addKeyBoardToolBar()
        addSendButton()
    }
    func addCloseButton(){
        closeButton = UIButton(frame: CGRect(x: self.width - kCancelButtonWidth, y: 20 + (44 - kCancelButtonHeight) / 2, width: kCancelButtonWidth, height: kCancelButtonHeight))
        closeButton.setTitle("Cancel", forState: .Normal)
        closeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        closeButton.addTarget(self, action: #selector(FTUpdateStatus.cancelUpdate), forControlEvents: .TouchUpInside)
        self.addSubview(closeButton)
    }

    func addTextView(){
        textView = YYTextView(frame: CGRect(x: 0, y: 64, width: self.width, height: self.height - 64));
        textView.backgroundColor = UIColor.grayColor()
        textView.becomeFirstResponder()
        textView.font = UIFont.systemFontOfSize(16.0)
        self.addSubview(textView)
    }
    
    func addKeyBoardToolBar(){
        keyBoardTollBar = UIView(frame: CGRect(x: 0, y: 0, width: self.width, height: 40))
        keyBoardTollBar.backgroundColor = UIColor.greenColor()
        textView.inputAccessoryView = keyBoardTollBar
    
    }
    func addSendButton(){
        sendButton = UIButton(frame: CGRect(x: self.width - kKeyBoardButtonWidth, y: 0, width: kKeyBoardButtonWidth, height: keyBoardTollBar.height))
        sendButton.setTitle("发送", forState: .Normal)
        sendButton.addTarget(self, action: #selector(FTUpdateStatus.send), forControlEvents: .TouchUpInside)
        keyBoardTollBar.addSubview(sendButton)
    }
    //MARK: - Delegate
    func cancelUpdate(){
        textView.resignFirstResponder()
        if  delegate is FTUpdateStatusViewController {
            delegate.cancelUpdate()
        }
    }
    func send(){
        if  delegate is FTUpdateStatusViewController {
            delegate.send()
        }

    }
    
}
