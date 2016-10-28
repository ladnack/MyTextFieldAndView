//
//  ViewController.swift
//  MyTextFieldAndView
//
//  Created by 酒井恭平 on 2016/10/15.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
    
    var placeHolderTextView = PlaceHolderTextView(frame: CGRect(x: 67, y: 300, width: 240, height: 240))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初期化
//        let placeHolderTextView = PlaceHolderTextView.init(frame: CGRect(x: 67, y: 300, width: 240, height: 240))
        
        // プレースホルダーに値を設定する
        placeHolderTextView.placeHolder = "プレースホルダー"
        placeHolderTextView.placeHolderColor = UIColor.gray
        placeHolderTextView.borderColor = UIColor.blue
        placeHolderTextView.borderWidth = 5
        placeHolderTextView.cornerRadius = 10
        
        // 画面に表示
        self.view.addSubview(placeHolderTextView)
        
        
        textField.text = "ONE OK ROCK"
        textField.textColor = UIColor.blue
        textField.font = UIFont.preferredFont(forTextStyle: .caption1)
        textField.textAlignment = .center
        textField.placeholder = "Which musician do you like?"
        textField.borderStyle = .bezel
        textField.clearButtonMode = .whileEditing
        
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .google
        textField.autocapitalizationType = .words
        textField.keyboardAppearance = .dark
        textField.autocorrectionType = .yes
        
//        textField.adjustsFontSizeToFitWidth = true
//        textField.minimumFontSize = 2
        
//        textField.leftViewMode = .always
        
        textField.delegate = self
        textView.delegate = self
        
        
//        let myTextView = MyTextView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
//        myTextView.textAlignment
//        myTextView.setText(text: "SCANDAL")
//        myTextView.placeHolder = "SCANDAL"
//        myTextView.placeHolderColor = UIColor.lightGray.withAlphaComponent(0.6)
//        self.view.addSubview(myTextView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("DidEndEditing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("\(range), \(string)")
        
        if let text = textField.text {
            var willText = ""
            
            if string.isEmpty {
                let endIndex = text.endIndex
                let secondEndIndex = text.index(before: endIndex)
                willText = text.substring(to: secondEndIndex)
                print("delete")
            } else {
                willText = text + string
            }
            
            print(willText)
            
            if willText.isEmpty {
                label.isHidden = false
            } else {
                label.isHidden = true
            }
            
        }
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        label.isHidden = false
        return true
    }
    
}


extension ViewController: UITextViewDelegate {
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        print("\(range), \(text)")
//        
//        if let viewText = textView.text {
//            var willText = ""
//            
//            if text.isEmpty {
//                let endIndex = viewText.endIndex
//                let secondEndIndex = viewText.index(before: endIndex)
//                willText = viewText.substring(to: secondEndIndex)
//                print("delete")
//            } else {
//                willText = viewText + text
//            }
//            
//            print(willText)
//            
//            if willText.isEmpty {
//                label.isHidden = false
//            } else {
//                label.isHidden = true
//            }
//            
//        }
//        
//        return true
//    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChange")
        
        if let viewText = textView.text {
            if viewText.isEmpty {
                label.isHidden = false
            } else {
                label.isHidden = true
            }
        }
        
    }
    
}








