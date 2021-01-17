//
//  AuthorizationViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit
import FirebaseAuth

class AuthorizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.main.async {
            if Auth.auth().currentUser?.uid != nil || Auth.auth().currentUser?.email != nil {
                let storyboard = UIStoryboard(name: Storyboards.Authorization.rawValue, bundle: nil)
                let testAuthView = storyboard.instantiateViewController(withIdentifier: ViewControllers.TestAuthView.rawValue) as! TestAuthViewViewController
                testAuthView.modalPresentationStyle = .fullScreen
                self.present(testAuthView, animated: true)
            }
        }
    }
 
    @IBAction func signIn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboards.Authorization.rawValue, bundle: nil)
        let authorizationSignIn = storyboard.instantiateViewController(withIdentifier: ViewControllers.AuthorizationSignIn.rawValue)
        authorizationSignIn.modalPresentationStyle = .fullScreen
        present(authorizationSignIn, animated: true)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboards.Authorization.rawValue, bundle: nil)
        let authorizationSignUp = storyboard.instantiateViewController(withIdentifier: ViewControllers.AuthorizationSignUp.rawValue)
        authorizationSignUp.modalPresentationStyle = .fullScreen
        present(authorizationSignUp, animated: true)
    }

    @IBAction func closeSegue(_ sender: UIStoryboardSegue) {
        
    }
    
}
