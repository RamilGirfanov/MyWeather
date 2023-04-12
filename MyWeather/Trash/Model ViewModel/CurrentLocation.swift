//
//  CurrentLocation.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 20.01.2023.
//

import Foundation

struct CurrentLocation {
    let cityName: String
    
    init?(curentLocationData: CurrentLocationData) {
        cityName = curentLocationData.first!.localNames["ru"] ?? curentLocationData.first!.name
    }}
