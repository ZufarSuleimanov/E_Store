//
//  AuthorizationExtensions.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 08.12.2020.
//

import UIKit

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
