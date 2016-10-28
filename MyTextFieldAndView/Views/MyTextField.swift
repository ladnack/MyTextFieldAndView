//
//  MyTextField.swift
//  MyTextFieldAndView
//
//  Created by 酒井恭平 on 2016/10/15.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

class MyTextField: UITextField {
    
    override var text: String? {
        didSet{
            print("TextField.didSet: \(text)")
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
