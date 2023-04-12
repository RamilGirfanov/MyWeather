//
//  NetworkService.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 15.01.2023.
//

import Foundation

class NetworkService {
    var lat: Double = 0
    var lon: Double = 0
    
    var cityName: String?
        
    lazy var urlLocationString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(appid)&lang=\(lang)&units=metric"
    
    lazy var urlTranslateString = "https://api.openweathermap.org/geo/1.0/reverse?lat=\(lat)&lon=\(lon)&appid=\(appid)"
}
