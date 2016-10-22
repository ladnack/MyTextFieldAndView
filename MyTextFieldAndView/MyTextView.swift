//
//  MyTextView.swift
//  MyTextFieldAndView
//
//  Created by 酒井恭平 on 2016/10/15.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

class MyTextView: UITextView {
    
    var placeholderLabel: UILabel      = UILabel()
    var placeholderColor: UIColor      = UIColor.lightGray
    var placeholder: NSString          = ""
    
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
        if placeholder.length > 0 {
            placeholderLabel.frame           = CGRect(x: 8, y: 8, width: self.bounds.size.width - 16, height: 0)
            placeholderLabel.lineBreakMode   = .byWordWrapping
            placeholderLabel.numberOfLines   = 0
            placeholderLabel.font            = self.font
            placeholderLabel.backgroundColor = UIColor.clear
            placeholderLabel.textColor       = placeholderColor
            placeholderLabel.alpha           = 0
            placeholderLabel.tag             = 999
            
            placeholderLabel.text = placeholder as String
            placeholderLabel.sizeToFit()
            self.addSubview(placeholderLabel)
        }
        
        self.sendSubview(toBack: placeholderLabel)
        
        if self.text.characters.count == 0 && placeholder.length > 0 {
            self.viewWithTag(999)?.alpha = 1
        }
        
        super.draw(rect)
    }
    
    func textChanged(notification: NSNotification?)  {
        if self.placeholder.length == 0 {
            return
        }
        
        if self.text.characters.count == 0 {
            self.viewWithTag(999)?.alpha = 1
        } else {
            self.viewWithTag(999)?.alpha = 0
        }
    }
    
}











