//
//  NetworkService.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 15.01.2023.
//

import Foundation

class NetworkService {
    var lat: Double = 60.001974
    var lon: Double = 30.389077
        
    lazy var urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(appid)&lang=\(lang)"
}
