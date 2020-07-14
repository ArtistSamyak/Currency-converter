//
//  LocationData.swift
//  Currency converter
//
//  Created by Samyak Pawar on 14/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import Foundation

struct LocationData: Codable {
    let sys: Sys
}

struct Sys: Codable {
    var country: String
}
