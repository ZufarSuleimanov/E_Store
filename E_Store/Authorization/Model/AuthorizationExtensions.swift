//
//  AuthorizationExtensions.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 08.12.2020.
//

import UIKit

var lengthСheckPhoneNumber = false

extension AuthorizationSignInViewController: UITextFieldDelegate {
    

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

extension AuthorizationSignInForPhoneNumberViewController: UIPopoverPresentationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
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

    func textFieldDidChangeSelection(_ textField: UITextField) {

        if textField == self.subscriberPhoneNumberTextField {
            if textField.text?.count ?? 0 >= 10
            { lengthСheckPhoneNumber = true}
            else
            { lengthСheckPhoneNumber = false }
        }

        if lengthСheckPhoneNumber {
            getSMSCodeButton.alpha = 1
            getSMSCodeButton.isEnabled = true
        } else {
            getSMSCodeButton.alpha = 0.5
            getSMSCodeButton.isEnabled = false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text?.count == 6 {
            
            getStartedButton.alpha = 1
            getStartedButton.isEnabled = true
            statusLabel.text = "Code length is correct"
        } else {
            statusLabel.text = "The code is not fully entered"
            getStartedButton.alpha = 0.5
            getStartedButton.isEnabled = false
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
