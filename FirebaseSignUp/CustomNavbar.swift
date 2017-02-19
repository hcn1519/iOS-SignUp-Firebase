//
//  CustomNavbar.swift
//  FirebaseSignUp
//
//  Created by 홍창남 on 2017. 2. 19..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class CustomNavbar: UINavigationBar {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: 120.0 / 255.0, green: 120.0 / 255.0, blue: 120.0 / 255.0, alpha: 120.0 / 255.0).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)

    }
}
