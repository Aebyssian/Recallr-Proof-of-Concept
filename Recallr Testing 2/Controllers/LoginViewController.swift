//
//  LoginViewController.swift
//  Recallr Testing 2
//
//  Created by Jacob Wilson on 3/14/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginInButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }
    
    
    @IBAction func loginInButtonPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.text = e.localizedDescription
                    self.errorLabel.isHidden = false
                } else {
                    //self.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
                // ...
            }
        }
    }
    
    
    
}
