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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backBBI(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func getSMScodeB(_ sender: UIButton) {
    }
    @IBAction func getStartedB(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
