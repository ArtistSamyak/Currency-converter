//
//  Currency.swift
//  Currency converter
//
//  Created by Samyak Pawar on 14/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import Foundation

struct Currency {
    let country : String
    let currency : String
    var relativeRate: Float
    
    init(country : String, currency : String, relativeRate: Float) {
        self.country = country
        self.currency = currency
        self.relativeRate = relativeRate
    }
}

