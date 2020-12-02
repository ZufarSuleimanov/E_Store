//
//  AuthorizationSignInViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit

class AuthorizationSignInViewController: UIViewController {

    @IBOutlet weak var flagsForPhoneNumbersTF: UITextField!
    @IBOutlet weak var subscriberPhoneNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func showFlagsForPhoneNumbersB(_ sender: UIButton) {
    }
    @IBAction func backBBI(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func signInB(_ sender: UIButton) {
    }

}
