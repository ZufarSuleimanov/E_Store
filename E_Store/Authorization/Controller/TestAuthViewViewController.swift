//
//  TestAuthViewViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 27.12.2020.
//

import UIKit
import FirebaseAuth

class TestAuthViewViewController: UIViewController {
    
    @IBAction func exitBBI(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            resetUserDefaults()
            performSegue(withIdentifier: "closeSegue", sender: self)
        } catch { }
    }
    
    func resetUserDefaults(){

        let userDefaults = UserDefaults()
        let dict = userDefaults.dictionaryRepresentation() as NSDictionary

        for key in dict.allKeys {
            userDefaults.removeObject(forKey: key as! String)
        }

        userDefaults.synchronize()
    }
}
