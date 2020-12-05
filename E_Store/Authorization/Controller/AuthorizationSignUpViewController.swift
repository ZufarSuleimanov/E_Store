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
        popOverFlagsForPhoneNumbersVC?.sourceRect = CGRect(x: self.flagsForPhoneNumbersTF.bounds.midX, y: self.flagsForPhoneNumbersTF.bounds.maxY, width: 0, height: 0)
        popFlagsForPhoneNumbersVC.preferredContentSize = CGSize(width: 240, height: 200)
        self.present(popFlagsForPhoneNumbersVC, animated: true)
        popFlagsForPhoneNumbersVC.completion = { [weak self] text in
            guard let self = self else { return }
            self.flagsForPhoneNumbersTF.text = text
        }
    }
    
    @IBAction func getSMScodeB(_ sender: UIButton) {}
    @IBAction func getStartedB(_ sender: UIButton) {}
}

extension AuthorizationSignUpViewController: UIPopoverPresentationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString text: String) -> Bool{
        let currentCharacterCount = textField.text?.count ?? 0
        let staticRange = 10
        return setupConfig(currentCharacterCount:currentCharacterCount, range: range, text: text, staticRange:staticRange)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentCharacterCount = textView.text?.count ?? 0
        let staticRange = 6
        return setupConfig(currentCharacterCount:currentCharacterCount, range: range, text: text, staticRange:staticRange)
    }
    
    func setupConfig(currentCharacterCount: Int, range: NSRange, text: String, staticRange:Int) -> Bool {
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + text.count - range.length
        return newLength <= staticRange
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text?.count == 6 {
            statusL.text = "Норм"
        } else {
            statusL.text = "Не норм"
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
