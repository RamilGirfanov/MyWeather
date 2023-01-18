//
//  CurrentWeatherData.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 17.01.2023.
//

import Foundation

struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
}

struct Main: Decodable {
//    use
    let temp: Double
//    use
    let feelsLike: Double
//    use
    let tempMin: Double
//    use
    let tempMax: Double
//    use
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

struct Weather: Decodable {
    let id: Int
    let main: String
//    use
    let description: String
    //    use
    let icon: String
}

struct Wind: Decodable {
//    use
    let speed: Double
    let deg: Int
    let gust: Double
}
