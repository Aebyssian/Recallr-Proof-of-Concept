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

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var doNotMatchLabel: UILabel!
    @IBOutlet weak var passwordConfirmField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        doNotMatchLabel.isHidden = true
        super.viewDidLoad()
        print("View loaded")
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        if let pass = passwordField.text {
            if pass == passwordConfirmField.text ?? "" {
                if let email = emailField.text {
                    Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
                        
                        if let e = error {
                            let desc = e.localizedDescription
                            self.doNotMatchLabel.text = desc
                            self.doNotMatchLabel.isHidden = false
                        } else {
                            //self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                        }
                    }
                }
                else {
                    doNotMatchLabel.text = "Please enter an email."
                    doNotMatchLabel.isHidden = false
                }
            }
            else {
                doNotMatchLabel.text = "Passwords do not match."
                doNotMatchLabel.isHidden = false
            }
        }
        else {
            doNotMatchLabel.text = "Please enter a password."
            doNotMatchLabel.isHidden = false
        }
    }
}
