//
//  CustomTextView.swift
//  MyTextFieldAndView
//
//  Created by 酒井恭平 on 2016/10/20.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

@IBDesignable
final class CustomTextView: UITextView {
    
    // MARK: - placeholer
    
    private let placeholderLabel = UILabel()
    
    // default is nil. string is drawn 70% gray
    @IBInspectable var placeholder: String? {
        didSet {
            print("placeholder did set.")
            placeholderLabel.text = placeholder
            // sizeToFit()がないとLabelが表示されない
            placeholderLabel.sizeToFit()
        }
    }
    
    
    // MARK: - initializers
    
    init() {
        super.init(frame: .null, textContainer: nil)
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, textContainer: nil)
        observeTextDidChange()
        initPlaceholder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: - private methods
    
    private func observeTextDidChange() {
        // 通知を登録する
        NotificationCenter.default.addObserver(self, selector: #selector(controlPlaceholder(_:)), name: .UITextViewTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewTextDidEndEditing(_:)), name: .UITextViewTextDidEndEditing, object: nil)
    }
    
    // Placeholerの初期化設定(1回のみ)
    private func initPlaceholder() {
        // sizeToFit()を使うならいらないかも
        placeholderLabel.frame = frame
        self.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5)
        placeholderLabel.frame.origin = CGPoint(x: 8, y: 5)
        // default is clear
        placeholderLabel.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        // default is 70% gray
        placeholderLabel.textColor = UIColor.gray.withAlphaComponent(0.7)
        
        placeholderLabel.font = font
        print(placeholderLabel.font.pointSize)
        placeholderLabel.textAlignment = textAlignment
        
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
            placeholderLabel.textAlignment = textAlignment
        }
    }
    
    override var font: UIFont? {
        didSet {
            print("didiSet: \(font)")
            placeholderLabel.font = font
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


















