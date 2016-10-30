//
//  CustomViewController.swift
//  MyTextFieldAndView
//
//  Created by 酒井恭平 on 2016/10/21.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    var textView = CustomTextView(frame: CGRect.zero)
    var textField = UITextField(frame: CGRect.zero)
    var placeHolderTextView = PlaceHolderTextView(frame: CGRect.zero)
    
    let width: CGFloat = 200
    let textViewHeight: CGFloat = 100
    let textFieldhHeight: CGFloat = 50
    let buttonHeight: CGFloat = 50
    var centerPositionX: CGFloat { return self.view.frame.width / 2}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextView()
        configureTextField()
        configureButton()
        configurePlaceHolderTextView()
        
    }
    
    func configureTextView() {
        textView.frame.size = CGSize(width: width, height: textViewHeight)
        textView.layer.position = CGPoint(x: centerPositionX, y: 100)
        textView.text = "Fist text"
        textView.placeholder = "Placeholder"
        textView.delegate = self
        
        view.addSubview(textView)
    }
    
    func configureTextField() {
        textField.frame.size = CGSize(width: width, height: textFieldhHeight)
        textField.layer.position = CGPoint(x: centerPositionX, y: 100 + textViewHeight / 2 + textViewHeight / 2)
        textField.text = "Fist text"
        textField.placeholder = "Placeholder"
        textField.borderStyle = .line
        textField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChanged(_:)), name: .UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidEndEditing(_:)), name: .UITextFieldTextDidEndEditing, object: nil)
        
        view.addSubview(textField)
    }
    
    // TextFieldのTextが変更された時に呼ばれる
    func textFieldTextDidChanged(_ notification: NSNotification) {
        print("Notification->UITextFieldTextDidChange!")
    }
    
    // TextFieldのTextが編集終了時に呼ばれる
    func textFieldTextDidEndEditing(_ notification: NSNotification) {
        print("Notification->UITextFieldTextDidEndEditing!")
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
    
    func configureButton() {
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: width, height: buttonHeight)
        button.layer.position = CGPoint(x: centerPositionX, y: textField.layer.position.y + textFieldhHeight / 2 + buttonHeight / 2)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.setTitle("Pushed", for: .highlighted)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    func tapButton(_ sender: UIButton) {
        print("TapButton!")
        textView.text = textView.text + "+addText"
        textView.textAlignment = .center
        
        textField.text = textField.text! + "+addText"
        
        placeHolderTextView.text = placeHolderTextView.text + "+addText"
    }
    

}


extension CustomViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


extension CustomViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        print("Delegate->textViewDidChange")
    }
    
}











