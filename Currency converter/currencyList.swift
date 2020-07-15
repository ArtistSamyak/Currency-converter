//
//  currencyList.swift
//  Currency converter
//
//  Created by Samyak Pawar on 14/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import Foundation

struct currencyList {
    var list : [Currency] = [Currency(country: "US", currency: "USD", relativeRate: 0.0), Currency(country: "Japan", currency: "JPY", relativeRate: 0.0), Currency(country: "Bulgeria", currency: "BGN", relativeRate: 0.0), Currency(country: "Czech Republic", currency: "CZK", relativeRate: 0.0), Currency(country: "Denmark", currency: "DDK", relativeRate: 0.0), Currency(country: "UK", currency: "GBP", relativeRate: 0.0), Currency(country: "Hungary", currency: "HUF", relativeRate: 0.0), Currency(country: "Poland", currency: "PLN", relativeRate: 0.0), Currency(country: "Romania", currency: "RON", relativeRate: 0.0), Currency(country: "Sweden", currency: "SEK", relativeRate: 0.0), Currency(country: "Swisserland", currency: "CHF", relativeRate: 0.0), Currency(country: "Iceland", currency: "ISK", relativeRate: 0.0), Currency(country: "Norway", currency: "NOK", relativeRate: 0.0), Currency(country: "Croatia", currency: "HRK", relativeRate: 0.0), Currency(country: "Russia", currency: "RUB", relativeRate: 0.0), Currency(country: "Turkey", currency: "TRY", relativeRate: 0.0), Currency(country: "Australia", currency: "AUD", relativeRate: 0.0), Currency(country: "Brazil", currency: "BRL", relativeRate: 0.0), Currency(country: "Canada", currency: "CAD", relativeRate: 0.0), Currency(country: "China", currency: "CNY", relativeRate: 0.0),Currency(country: "Hong Kong", currency: "HKD", relativeRate: 0.0) , Currency(country: "Indonesia", currency: "IDR", relativeRate: 0.0), Currency(country: "Israel", currency: "ILS", relativeRate: 0.0),  Currency(country: "India", currency: "INR", relativeRate: 0.0), Currency(country: "South Korea", currency: "KRW", relativeRate: 0.0),Currency(country: "Mexico", currency: "MXN", relativeRate: 0.0) , Currency(country: "Malatia", currency: "MYR", relativeRate: 0.0), Currency(country: "New Zealand", currency: "NZD", relativeRate: 0.0),Currency(country: "Philippine", currency: "PHP", relativeRate: 0.0), Currency(country: "Singapore", currency: "SGD", relativeRate: 0.0), Currency(country: "Thiland", currency: "THB", relativeRate: 0.0), Currency(country: "South Africa", currency: "ZAR", relativeRate: 0.0)]
    
    var baceCurrency = "USD"
    var baceListNumber : Int = 0
    var locationName : String = ""
    var locationListNumber : Int?
    
    mutating func GetLocationListIndex(locationName: String){
        switch locationName {
        case list[0].country:
            locationListNumber = 0
        case list[1].country:
            locationListNumber = 1
        case list[2].country:
            locationListNumber = 2
        case list[3].country:
            locationListNumber = 3
        case list[4].country:
            locationListNumber = 4
        case list[5].country:
            locationListNumber = 5
        case list[6].country:
            locationListNumber = 6
        case list[7].country:
            locationListNumber = 7
        case list[8].country:
            locationListNumber = 8
        case list[9].country:
            locationListNumber = 9
        case list[10].country:
            locationListNumber = 10
        case list[11].country:
            locationListNumber = 11
        case list[12].country:
            locationListNumber = 12
        case list[13].country:
            locationListNumber = 13
        case list[14].country:
            locationListNumber = 14
        case list[15].country:
            locationListNumber = 15
        case list[16].country:
            locationListNumber = 16
        case list[17].country:
            locationListNumber = 17
        case list[18].country:
            locationListNumber = 18
        case list[19].country:
            locationListNumber = 19
        case list[20].country:
            locationListNumber = 20
        case list[21].country:
            locationListNumber = 21
        case list[22].country:
            locationListNumber = 22
        case list[23].country:
            locationListNumber = 23
        case list[24].country:
            locationListNumber = 24
        case list[25].country:
            locationListNumber = 25
        case list[26].country:
            locationListNumber = 26
        case list[27].country:
            locationListNumber = 27
        case list[28].country:
            locationListNumber = 28
        case list[29].country:
            locationListNumber = 29
        case list[30].country:
            locationListNumber = 30
        case list[31].country:
            locationListNumber = 31
        default:
            print("Different Syntax")
        }

    }
}


