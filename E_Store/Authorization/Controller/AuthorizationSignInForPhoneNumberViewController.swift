//
//  AuthorizationSignInForPhoneNumberViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit

class AuthorizationSignInForPhoneNumberViewController: UIViewController {
    
    var verificationID: String?
    
    @IBOutlet weak var flagsForPhoneNumbersTextField: UITextField!
    @IBOutlet weak var subscriberPhoneNumberTextField: UITextField!
    @IBOutlet weak var codeSMSTextView: UITextView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var showFlagsForPhoneNumbersButton: UIButton!
    @IBOutlet weak var getSMSCodeButton: UIButton!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var processActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfig()
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) { dismiss(animated: true) }
    
    @IBAction func showFlagsForPhoneNumbers(_ sender: UIButton) {
        guard let popFlagsForPhoneNumbersVC = storyboard?.instantiateViewController(identifier: ViewControllers.FlagsForPhoneNumbers.rawValue) as? FlagsForPhoneNumbersTableViewController else { return }
        popFlagsForPhoneNumbersVC.modalPresentationStyle = .popover
        let popOverFlagsForPhoneNumbersVC = popFlagsForPhoneNumbersVC.popoverPresentationController
        popOverFlagsForPhoneNumbersVC?.delegate = self
        popOverFlagsForPhoneNumbersVC?.sourceView = self.flagsForPhoneNumbersTextField
        popOverFlagsForPhoneNumbersVC?.sourceRect = CGRect(x: self.flagsForPhoneNumbersTextField.bounds.midX, y: self.flagsForPhoneNumbersTextField.bounds.midY, width: 0, height: 0)
        popFlagsForPhoneNumbersVC.preferredContentSize = CGSize(width: 240, height: 200)
        self.present(popFlagsForPhoneNumbersVC, animated: true)
        popFlagsForPhoneNumbersVC.getBackPhoneCodeAndFlag = { [weak self] text in
            guard let self = self else { return }
            self.flagsForPhoneNumbersTextField.text = text
        }
    }
    
    @IBAction func getSMSCode(_ sender: UIButton) {
        let phoneNumber = "\(flagsForPhoneNumbersTextField.text!)\(subscriberPhoneNumberTextField.text!)".dropFirst(2)
        AuthHandler.getPhoneNumber(phoneNumber: String(phoneNumber))
        getStartedButton.alpha = 1
        getStartedButton.isEnabled = true
        
    }
    
    @IBAction func getStarted(_ sender: UIButton) {
        verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
        AuthHandler.checkEnteredCode(code: codeSMSTextView.text, verificationID: verificationID!)
        performAnimation()
    }
    
    private func setupConfig(){
        getSMSCodeButton.alpha = 0.5
        getSMSCodeButton.isEnabled = false
        getStartedButton.alpha = 0.5
        getStartedButton.isEnabled = false
        
        codeSMSTextView.delegate = self
        subscriberPhoneNumberTextField.delegate = self
        processActivityIndicatorView.isHidden = true
    }
    
    private func triggerNotification(){
        let alertController = UIAlertController(title: "Error", message: "You entered an invalid SMS code.", preferredStyle: .alert)
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
            if self.verificationID != nil {
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


