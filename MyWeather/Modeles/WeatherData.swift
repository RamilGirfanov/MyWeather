//
//  WeatherData.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 17.01.2023.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [WeatherElement]
    let wind: Wind
}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct WeatherElement: Decodable {
    let description: String
    let icon: String
}

struct Wind: Decodable {
    let speed: Double
}
