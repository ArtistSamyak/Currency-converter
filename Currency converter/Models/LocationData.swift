//
//  LocationData.swift
//  Currency converter
//
//  Created by Samyak Pawar on 14/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import Foundation
//Used to fetch JSON responce to get Country name.
struct LocationData: Codable {
    let sys: Sys
}

struct Sys: Codable {
    var country: String
}
