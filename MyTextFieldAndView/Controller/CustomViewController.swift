//
//  CustomViewController.swift
//  MyTextFieldAndView
//
//  Created by 酒井恭平 on 2016/10/21.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    private var textView = CustomTextView(frame: CGRect.zero)
    private var textField = UITextField(frame: CGRect.zero)
    private var placeHolderTextView = PlaceHolderTextView(frame: CGRect.zero)
    
    private let width: CGFloat = 300
    private let textViewHeight: CGFloat = 300
    private let textFieldhHeight: CGFloat = 50
    private let buttonHeight: CGFloat = 50
    private var centerPositionX: CGFloat { return self.view.frame.width / 2}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextView()
        configureTextField()
        configureButton()
//        configurePlaceHolderTextView()
        
    }
    
    private func configureTextView() {
        textView.frame.size = CGSize(width: width, height: textViewHeight)
        textView.frame.origin = CGPoint(x: centerPositionX - width / 2, y: 100)
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 2
//        textView.text = "Fist text"
        textView.font = .systemFont(ofSize: 26.0)
        textView.placeholder = "Placeholder is the Placeholder a Placeholder for Placeholder"
        
        textView.customDelegate = self
        textView.buttonTitle = "Hello"
//        textView.accessoryViewIsHidden = true
        
        view.addSubview(textView)
    }
    
    private func configureTextField() {
        textField.frame.size = CGSize(width: width, height: textFieldhHeight)
        textField.frame.origin = CGPoint(x: centerPositionX - width / 2, y: textView.frame.origin.y + textViewHeight)
        textField.text = "Fist text"
        textField.placeholder = "Placeholder"
        textField.borderStyle = .line
        textField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChanged(_:)), name: .UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidEndEditing(_:)), name: .UITextFieldTextDidEndEditing, object: nil)
        
        view.addSubview(textField)
    }
    
    // TextFieldのTextが変更された時に呼ばれる
    @objc private func textFieldTextDidChanged(_ notification: NSNotification) {
//        print("Notification->UITextFieldTextDidChange!")
    }
    
    // TextFieldのTextが編集終了時に呼ばれる
    @objc private func textFieldTextDidEndEditing(_ notification: NSNotification) {
//        print("Notification->UITextFieldTextDidEndEditing!")
    }
    
    private func configurePlaceHolderTextView() {
        placeHolderTextView = PlaceHolderTextView(frame: CGRect(x: 67, y: 300, width: 240, height: 240))
        placeHolderTextView.placeHolder = "プレースホルダー"
        placeHolderTextView.placeHolderColor = UIColor.gray
        placeHolderTextView.borderColor = UIColor.blue
        placeHolderTextView.borderWidth = 5
        placeHolderTextView.cornerRadius = 10
        view.addSubview(placeHolderTextView)
    }
    
    private func configureButton() {
        let size = CGSize(width: width, height: buttonHeight)
        let point = CGPoint(x: centerPositionX - width / 2, y: textField.frame.origin.y + textFieldhHeight)
        let button = UIButton(frame: CGRect(origin: point, size: size))
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.setTitle("Pushed", for: .highlighted)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc private func tapButton(_ sender: UIButton) {
//        print("TapButton!")
        
        // textを追加
//        textView.text = textView.text + "+addText"
//        textView.textAlignment = .center
//        
//        textField.text = textField.text! + "+addText"
//        
//        placeHolderTextView.text = placeHolderTextView.text + "+addText"
        
        
        // textSizeを変更
        if let text = textField.text, let size = Int(text) {
            textView.font = .systemFont(ofSize: CGFloat(size))
        }
        
        
        // textContainerInsetのtopを変更
//        if let text = textField.text, let top = Int(text) {
//            textView.textContainerInset = UIEdgeInsets(top: CGFloat(top), left: 0, bottom: 0, right: 0)
//        }
        
    }
    

}


// MARK: - delegate methods

extension CustomViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


extension CustomViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
//        print("Delegate->textViewDidChange")
    }
    
}


extension CustomViewController: CustomTextViewDelegate {
    
    func customTextViewShouldDone(_ textView: CustomTextView) -> Bool {
        print("Delegate->customTextViewShouldDone")
        return true
    }
    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        print("Delegate->customTtextViewDidEndEditing")
//    }
    
}











