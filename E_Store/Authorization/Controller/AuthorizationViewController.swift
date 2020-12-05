//
//  AuthorizationViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit

class AuthorizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInB(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboards.Authorization.rawValue, bundle: nil)
        let authorizationSignIn = storyboard.instantiateViewController(withIdentifier: ViewControllers.AuthorizationSignIn.rawValue)
        authorizationSignIn.modalPresentationStyle = .fullScreen
        present(authorizationSignIn, animated: true)
    }
    @IBAction func signUpB(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboards.Authorization.rawValue, bundle: nil)
        let authorizationSignUp = storyboard.instantiateViewController(withIdentifier: ViewControllers.AuthorizationSignUp.rawValue)
        authorizationSignUp.modalPresentationStyle = .fullScreen
        present(authorizationSignUp, animated: true)
    }

}
