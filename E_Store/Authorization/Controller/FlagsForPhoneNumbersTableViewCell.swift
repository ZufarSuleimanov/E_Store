//
//  FlagsForPhoneNumbersTableViewCell.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import UIKit

class FlagsForPhoneNumbersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryFlagL: UILabel!
    @IBOutlet weak var countryNameL: UILabel!
    @IBOutlet weak var countryCodeL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func set(object: CountryFlagsForPhoneNumbers) {
        self.countryFlagL.text = object.countryFlag
        self.countryNameL.text = object.countryName
        self.countryCodeL.text = object.countryCode
    }

}
