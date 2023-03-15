//
//  SignUpViewController.swift
//  Recallr Testing 2
//
//  Created by Jacob Wilson on 3/14/23.
//

import UIKit
import Firebase

//good enough
//should replace with some while loops
//initially the passwordConfirmField kept returning nil so that's why this code is kinda weird

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var doNotMatchLabel: UILabel!
    @IBOutlet weak var passwordConfirmField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        doNotMatchLabel.isHidden = true
        super.viewDidLoad()
        passwordConfirmField.delegate = self
        passwordField.delegate = self
        
        print("View loaded")
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let pass = passwordField.text {
            if pass != passwordConfirmField.text ?? "" { //it can't unwrap it!
                doNotMatchLabel.isHidden = false
            }
            else {
                doNotMatchLabel.isHidden = true
                doNotMatchLabel.text = "Passwords do not match"
            }
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        if let pass = passwordField.text {
            if pass == passwordConfirmField.text ?? "" {
                if let email = emailField.text, let password = passwordField.text {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        
                        if let e = error {
                            print(e) //set doNotMatchLabel to localized description of error
                        } else {
                            //self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                        }
                    }
                }
            }
        }
    }
    
    
    
}
