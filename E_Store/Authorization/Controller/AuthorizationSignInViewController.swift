//
//  AuthorizationSignInViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit

class AuthorizationSignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var processActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        processActivityIndicatorView.isHidden = true
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) { dismiss(animated: true) }
    
    @IBAction func signIn(_ sender: UIButton) {
        AuthHandler.loginUsingEmail(email: emailTextField.text!, password: passwordTextField.text!)
        performAnimation()
    }
    
    @IBAction func signInForPhoneNumber(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboards.Authorization.rawValue, bundle: nil)
        let AuthorizationSignInForPhoneNumber = storyboard.instantiateViewController(withIdentifier: ViewControllers.AuthorizationSignInForPhoneNumber.rawValue)
        AuthorizationSignInForPhoneNumber.modalPresentationStyle = .fullScreen
        present(AuthorizationSignInForPhoneNumber, animated: true)
    }
    
    private func triggerNotification(){
        let alertController = UIAlertController(title: "Error", message: "You have not completed all the fields.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
    private func performAnimation(){
        processActivityIndicatorView.startAnimating()
        processActivityIndicatorView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.processActivityIndicatorView.stopAnimating()
            self.processActivityIndicatorView.isHidden = true
            let authEmail = UserDefaults.standard.string(forKey: "authEmail")
            if authEmail != nil {
                let storyboard = UIStoryboard(name: Storyboards.Authorization.rawValue, bundle: nil)
                let testAuthView = storyboard.instantiateViewController(withIdentifier: ViewControllers.TestAuthView.rawValue)
                testAuthView.modalPresentationStyle = .fullScreen
                self.present(testAuthView, animated: true)
            } else {
                self.triggerNotification()
            }
        }
    }
    
}
