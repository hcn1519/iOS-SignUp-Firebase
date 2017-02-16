//
//  ViewController.swift
//  FirebaseSignUp
//
//  Created by 홍창남 on 2017. 2. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var subTitleLbl: UILabel!
    
    var subTitle: String = "Read and write the stories\n that matter to you"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subTitleLbl.text = subTitle
        
    }


}

