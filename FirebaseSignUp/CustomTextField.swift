//
//  CustomTextField.swift
//  FirebaseSignUp
//
//  Created by 홍창남 on 2017. 2. 17..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import Material

class CustomTextField: TextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        var frameRect: CGRect = self.frame;
        frameRect.size.height = 40;
        self.frame = frameRect;
    }

}
