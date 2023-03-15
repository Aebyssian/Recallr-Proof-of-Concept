//
//  InitialViewController.swift
//  Recallr Testing 2
//
//  Created by Jacob Wilson on 3/14/23.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
        signUpButton.layer.cornerRadius = 20
    }
}
