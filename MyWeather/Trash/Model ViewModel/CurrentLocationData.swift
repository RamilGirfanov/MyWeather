//
//  CurrentLocationData.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 20.01.2023.
//

import Foundation

struct CurrentLocationDataElement: Codable {
    let name: String
    let localNames: [String: String]
    let lat, lon: Double
    let country, state: String

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}

typealias CurrentLocationData = [CurrentLocationDataElement]
