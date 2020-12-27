//
//  FlagsForPhoneNumbersTableViewController.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit

class FlagsForPhoneNumbersTableViewController: UITableViewController {
    
    var getBackPhoneCodeAndFlag: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getBackPhoneCodeAndFlag?("\(objects[indexPath.row].countryFlag) \(objects[indexPath.row].countryCode)")
        dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountyFlagForPhoneNumberCell", for: indexPath) as! FlagsForPhoneNumbersTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)
        return cell
    }
}
