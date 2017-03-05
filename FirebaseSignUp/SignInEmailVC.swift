//
//  SignInEmailVC.swift
//  FirebaseSignUp
//
//  Created by 홍창남 on 2017. 2. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import Firebase

class SignInEmailVC: UIViewController {

    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    
    let descript: String = "Enter your email address to\n sign in or create an account"
    var firstLogIn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLbl.text = descript
        
        emailField.becomeFirstResponder()
        passwordField.isSecureTextEntry = true
    }
    
    @IBAction func SignInBtnPressed(_ sender: Any) {
        var message: String!
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("창남 - Firebase 이메일 로그인")
                    self.completeSignIn(uid: user?.uid, message: message, firstLogIn: self.firstLogIn)
                } else {
                    if let errCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                        switch errCode {
                        case .errorCodeWrongPassword:
                            message = "잘못된 비밀번호입니다."
                            print("창남 - \(message)")
                            self.completeSignIn(uid: user?.uid, message: message, firstLogIn: self.firstLogIn)
                        default:
                            FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                                if error != nil {
                                    print("창남 - Firebase 이메일 인증을 할 수 없습니다.")
                                    if let errCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                                        switch errCode {
                                        case .errorCodeInvalidEmail:
                                            message = "잘못된 형식의 이메일입니다."
                                            print("창남 - \(message)")
                                        case .errorCodeEmailAlreadyInUse:
                                            message = "이미 사용되고 있는 이메일입니다."
                                            print("창남 - \(message)")
                                        default: ()
                                        }
                                    }
                                    self.completeSignIn(uid: user?.uid, message: message, firstLogIn: self.firstLogIn)
                                } else {
                                    self.firstLogIn = true
                                    self.completeSignIn(uid: user?.uid, message: message, firstLogIn: self.firstLogIn)
                                }
                            })
                        }
                    }
                    
                }
                
            })
        }
    }
    
    func completeSignIn(uid: String?, message: String?, firstLogIn: Bool) {
        if uid != nil {
            performSegue(withIdentifier: "goToFeedVC", sender: nil)
        } else {
            print("complete SignIn : \(firstLogIn)")
            if firstLogIn {
                performSegue(withIdentifier: "goToFeedVC", sender: nil)
            } else {
                let alert = UIAlertController(title: "로그인 실패", message: message, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
}
