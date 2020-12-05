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
    @IBOutlet weak var showFlagsForPhoneNumbersB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscriberPhoneNumberTF.delegate = self
    }
    
    @IBAction func backBBI(_ sender: UIBarButtonItem) { dismiss(animated: true) }
    
    @IBAction func showFlagsForPhoneNumbersB(_ sender: UIButton) {
        guard let popFlagsForPhoneNumbersVC = storyboard?.instantiateViewController(identifier: ViewControllers.FlagsForPhoneNumbers.rawValue) as? FlagsForPhoneNumbersTableViewController else { return }
        popFlagsForPhoneNumbersVC.modalPresentationStyle = .popover
        let popOverFlagsForPhoneNumbersVC = popFlagsForPhoneNumbersVC.popoverPresentationController
        popOverFlagsForPhoneNumbersVC?.delegate = self
        popOverFlagsForPhoneNumbersVC?.sourceView = self.flagsForPhoneNumbersTF
        popOverFlagsForPhoneNumbersVC?.sourceRect = CGRect(x: self.flagsForPhoneNumbersTF.bounds.midX, y: self.flagsForPhoneNumbersTF.bounds.maxY, width: 0, height: 0)
        popFlagsForPhoneNumbersVC.preferredContentSize = CGSize(width: 240, height: 200)
        self.present(popFlagsForPhoneNumbersVC, animated: true)
        popFlagsForPhoneNumbersVC.completion = { [weak self] text in
            guard let self = self else { return }
            self.flagsForPhoneNumbersTF.text = text
        }
    }
    
    @IBAction func signInB(_ sender: UIButton) {}
    
}

extension AuthorizationSignInViewController: UIPopoverPresentationControllerDelegate, UITextFieldDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString text: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + text.count - range.length
        return newLength <= 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
