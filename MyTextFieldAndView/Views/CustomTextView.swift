//
//  CustomTextView.swift
//  MyTextFieldAndView
//
//  Created by 酒井恭平 on 2016/10/20.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextView: UITextView {
    
    // MARK: - placeholer
    
    private let placeholderLabel = UILabel()
    
    // default is nil. string is drawn 70% gray
    @IBInspectable var placeholder: String? {
        didSet {
            print("placeholder did set.")
        }
    }
    
    
    // MARK: - initializers
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: .null, textContainer: nil)
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, textContainer: nil)
        observeTextDidChange()
        configurePlaceholder(in: frame)
    }
    
    
    // MARK: - private methods
    
    private func observeTextDidChange() {
        // 通知を登録する
        NotificationCenter.default.addObserver(self, selector: #selector(controlPlaceholder(_:)), name: .UITextViewTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewTextDidEndEditing(_:)), name: .UITextViewTextDidEndEditing, object: nil)
    }
    
    private func configurePlaceholder(in rect: CGRect) {
        placeholderLabel.frame = rect
//        placeholderLabel.frame.origin = CGPoint.zero
        placeholderLabel.text = placeholder
        placeholderLabel.font = self.font
        placeholderLabel.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        placeholderLabel.textColor = UIColor.gray.withAlphaComponent(0.7)
        placeholderLabel.textAlignment = self.textAlignment
//        placeholderLabel.textAlignment = .center
        placeholderLabel.sizeToFit()
        
        self.addSubview(placeholderLabel)
//        self.sendSubview(toBack: placeholderLabel)
        print("Add placeholderLabel as subView")
    }
    
    // TextViewのTextが変更された時に呼ばれる
    @objc private func controlPlaceholder(_ notification: NSNotification) {
        print("Notification->UITextViewTextDidChange!")
        placeholderIsHidden()
    }
    
    // TextViewのTextが編集終了時に呼ばれる
    @objc private func textViewTextDidEndEditing(_ notification: NSNotification) {
        print("Notification->UITextViewTextDidEndEditing!")
    }
    
    private func placeholderIsHidden() {
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    
    // MARK: - override properties
    
    override var text: String! {
        didSet {
            print("didiSet: " + text)
            placeholderIsHidden()
        }
    }
    
    override var textAlignment: NSTextAlignment {
        didSet {
            print("didiSet: \(textAlignment)")
            placeholderLabel.textAlignment = self.textAlignment
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

}


















