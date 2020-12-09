//
//  AuthorizationSignUpViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit

class AuthorizationSignUpViewController: UIViewController {
    
    @IBOutlet weak var flagsForPhoneNumbersTF: UITextField!
    @IBOutlet weak var subscriberPhoneNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var codeSMSTV: UITextView!
    @IBOutlet weak var statusL: UILabel!
    @IBOutlet weak var showFlagsForPhoneNumbersB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        flagsForPhoneNumbersTF.isEnabled = true
        flagsForPhoneNumbersTF.alpha = 0.5
        
        codeSMSTV.delegate = self
        subscriberPhoneNumberTF.delegate = self
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
    
    @IBAction func getSMScodeB(_ sender: UIButton) {
        let phoneNumberString = "\(flagsForPhoneNumbersTF.text!)\(subscriberPhoneNumberTF.text!)"
        let phoneNumber = phoneNumberString.dropFirst(2)
    }
    @IBAction func getStartedB(_ sender: UIButton) {}
}


