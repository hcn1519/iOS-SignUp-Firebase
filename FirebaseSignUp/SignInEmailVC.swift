//
//  SignInEmailVC.swift
//  FirebaseSignUp
//
//  Created by 홍창남 on 2017. 2. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class SignInEmailVC: UIViewController {

    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    var descript: String = "Enter your email address to\n sign in or create an account"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLbl.text = descript
        
        emailField.becomeFirstResponder()
    }
    
    
}
