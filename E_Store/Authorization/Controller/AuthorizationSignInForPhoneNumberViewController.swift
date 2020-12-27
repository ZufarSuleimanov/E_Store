//
//  AuthorizationSignInForPhoneNumberViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit

class AuthorizationSignInForPhoneNumberViewController: UIViewController {
    
    @IBOutlet weak var flagsForPhoneNumbersTF: UITextField!
    @IBOutlet weak var subscriberPhoneNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var codeSMSTV: UITextView!
    @IBOutlet weak var statusL: UILabel!
    @IBOutlet weak var showFlagsForPhoneNumbersB: UIButton!
    @IBOutlet weak var getSMSCodeB: UIButton!
    @IBOutlet weak var getStartedB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
    }
    
    @IBAction func backBBI(_ sender: UIBarButtonItem) { dismiss(animated: true) }
    
    @IBAction func showFlagsForPhoneNumbersB(_ sender: UIButton) {
        guard let popFlagsForPhoneNumbersVC = storyboard?.instantiateViewController(identifier: ViewControllers.FlagsForPhoneNumbers.rawValue) as? FlagsForPhoneNumbersTableViewController else { return }
        popFlagsForPhoneNumbersVC.modalPresentationStyle = .popover
        let popOverFlagsForPhoneNumbersVC = popFlagsForPhoneNumbersVC.popoverPresentationController
        popOverFlagsForPhoneNumbersVC?.delegate = self
        popOverFlagsForPhoneNumbersVC?.sourceView = self.flagsForPhoneNumbersTF
        popOverFlagsForPhoneNumbersVC?.sourceRect = CGRect(x: self.flagsForPhoneNumbersTF.bounds.midX, y: self.flagsForPhoneNumbersTF.bounds.midY, width: 0, height: 0)
        popFlagsForPhoneNumbersVC.preferredContentSize = CGSize(width: 240, height: 200)
        self.present(popFlagsForPhoneNumbersVC, animated: true)
        popFlagsForPhoneNumbersVC.getBackPhoneCodeAndFlag = { [weak self] text in
            guard let self = self else { return }
            self.flagsForPhoneNumbersTF.text = text
        }
    }
    
    @IBAction func getSMSCodeB(_ sender: UIButton) {
        let phoneNumber = "\(flagsForPhoneNumbersTF.text!)\(subscriberPhoneNumberTF.text!)".dropFirst(2)
        AuthHandler.getPhoneNumber(phoneNumber: String(phoneNumber))
        getStartedB.alpha = 1
        getStartedB.isEnabled = true
        
    }
    @IBAction func getStartedB(_ sender: UIButton) {
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
        AuthHandler.checkEnteredCode(code: codeSMSTV.text, verificationID: verificationID!)
        if verificationID != nil {
            let storyboard = UIStoryboard(name: Storyboards.Authorization.rawValue, bundle: nil)
            let testAuthView = storyboard.instantiateViewController(withIdentifier: ViewControllers.TestAuthView.rawValue)
            testAuthView.modalPresentationStyle = .fullScreen
            present(testAuthView, animated: true)
        } else {
            let alertController = UIAlertController(title: "Error", message: "You entered an invalid SMS code", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alertController.addAction(cancel)
            present(alertController, animated: true)
        }
    }
    
    private func setupConfig(){
        getSMSCodeB.alpha = 0.5
        getSMSCodeB.isEnabled = false
        getStartedB.alpha = 0.5
        getStartedB.isEnabled = false
        
        codeSMSTV.delegate = self
        subscriberPhoneNumberTF.delegate = self
        passwordTF.delegate = self
    }
}


