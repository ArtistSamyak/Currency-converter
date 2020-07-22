//
//  JSONStruct.swift
//  Currency converter
//
//  Created by Samyak Pawar on 14/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import Foundation
// Used to fetch required data for currency conversion using API
struct JSONStruct: Codable {
    let base : String
    let date : String
    let rates : Rate
    
}

struct Rate: Codable {
    let CAD : Double
    let HKD    : Double
    let ISK    :Double
    let PHP    :Double
    let DKK    :Double
    let HUF    :Double
    let CZK    :Double
    let GBP    :Double
    let RON    :Double
    let SEK    :Double
    let IDR    :Double
    let INR    :Double
    let BRL    :Double
    let RUB    :Double
    let HRK    :Double
    let JPY    :Double
    let THB    :Double
    let CHF    :Double
    let EUR    :Double
    let MYR    :Double
    let BGN    :Double
    let TRY    :Double
    let CNY    :Double
    let NOK    :Double
    let NZD    :Double
    let ZAR    :Double
    let USD    :Double
    let MXN    :Double
    let SGD    :Double
    let AUD    :Double
    let ILS    :Double
    let KRW    :Double
    let PLN    :Double
}



