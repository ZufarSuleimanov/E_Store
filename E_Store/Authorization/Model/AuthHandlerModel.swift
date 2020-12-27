//
//  AuthHandlerModel.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 06.12.2020.
//

import Foundation
import FirebaseAuth

class AuthHandler {
    
    static func checkEnteredCode(code: String, verificationID: String) {
        let credetional = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)
        Auth.auth().signIn(with: credetional) { (_, error) in
            if error != nil {
                print(error?.localizedDescription ?? "is empty")
            } else {}
        }
    }
    
    static func getPhoneNumber(phoneNumber: String) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if error != nil {
                print(error?.localizedDescription ?? "is empty")
            } else {
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            }
        }
    }
    
    static func createUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print(error?.localizedDescription ?? "is empty")
            } else {
                UserDefaults.standard.set(authResult?.user.email, forKey: "authEmail")
            }
        }
    }
    
    static func loginUsingEmail(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print(error?.localizedDescription ?? "is empty")
            } else {
                UserDefaults.standard.set(authResult?.user.email, forKey: "authEmail")}
        }
    }
    
}

