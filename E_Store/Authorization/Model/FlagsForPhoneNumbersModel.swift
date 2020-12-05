//
//  FlagsForPhoneNumbersModel.swift
//  E_Store
//
//  Created by Zufar Suleimanov on 02.12.2020.
//

import Foundation

struct CountryFlagsForPhoneNumbers {
    var countryFlag: String
    var countryName: String
    var countryCode: String
}

var objects = [
    CountryFlagsForPhoneNumbers(countryFlag: "🇰🇿", countryName: "Kazakhstan", countryCode: "+7"),
    CountryFlagsForPhoneNumbers(countryFlag: "🇷🇺", countryName: "Russia", countryCode: "+7"),
    CountryFlagsForPhoneNumbers(countryFlag: "🇺🇦", countryName: "Ukraine", countryCode: "+380"),
    CountryFlagsForPhoneNumbers(countryFlag: "🇵🇱", countryName: "Poland", countryCode: "+48")
]
