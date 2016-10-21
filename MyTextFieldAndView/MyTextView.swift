//
//  MyTextView.swift
//  MyTextFieldAndView
//
//  Created by 酒井恭平 on 2016/10/15.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

class MyTextView: UITextView {
    
    var placeHolderLabel: UILabel      = UILabel()
    var placeHolderColor: UIColor      = UIColor.lightGray
    var placeHolder: NSString          = ""
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self, selector: #selector(MyTextView.textChanged(notification:)), name: .UITextViewTextDidChange, object: nil)
    }
    
    func setText(text: NSString) {
        super.text = text as String
        self.textChanged(notification: nil)
    }
    
    override func draw(_ rect: CGRect) {
        if placeHolder.length > 0 {
            placeHolderLabel.frame           = CGRect(x: 8, y: 8, width: self.bounds.size.width - 16, height:0)
            placeHolderLabel.lineBreakMode   = .byWordWrapping
            placeHolderLabel.numberOfLines   = 0
            placeHolderLabel.font            = self.font
            placeHolderLabel.backgroundColor = UIColor.clear
            placeHolderLabel.textColor       = placeHolderColor
            placeHolderLabel.alpha           = 0
            placeHolderLabel.tag             = 999
            
            placeHolderLabel.text = placeHolder as String
            placeHolderLabel.sizeToFit()
            self.addSubview(placeHolderLabel)
        }
        
        self.sendSubview(toBack: placeHolderLabel)
        
        if self.text.characters.count == 0 && placeHolder.length > 0 {
            self.viewWithTag(999)?.alpha = 1
        }
        
        super.draw(rect)
    }
    
    func textChanged(notification: NSNotification?)  {
        if self.placeHolder.length == 0 {
            return
        }
        
        if self.text.characters.count == 0 {
            self.viewWithTag(999)?.alpha = 1
        } else {
            self.viewWithTag(999)?.alpha = 0
        }
    }
    
}


//protocol MyTextViewDelegate: UITextViewDelegate {
//    
//}
//
//extension MyTextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        <#code#>
//    }
//
//}











