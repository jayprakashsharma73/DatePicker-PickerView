//
//  CountryData.swift
//  Picker
//
//  Created by Jay Prakash Sharma on 14/06/22.
//

import Foundation

class Country{
    var countriesName:String
    var citiesName:[String]
    init(country:String, cities:[String]) {
        self.countriesName = country
        self.citiesName = cities
    }
}
