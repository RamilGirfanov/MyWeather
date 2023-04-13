//
//  Weather.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 17.01.2023.
//

import Foundation

struct Weather {
    let cityName: String?
    let temperature: Double?
    let feelsLikeTempetature: Double?
    let tempMin: Double?
    let tempMax: Double?
    let pressure: Int?
    let humidity: Int?
    let description: String?
    let windSpeed: Double?
    
    private let iconCode: String?
    var systeemIconNameString: String? {
        switch iconCode {
        case "01d": return "sun.max"
        case "01n": return "moon.stars.fill"
        case "02d": return "cloud.sun.fill"
        case "02n": return "cloud.moon.fill"
        case "03d": return "cloud.fill"
        case "03n": return "cloud.fill"
        case "04d": return "cloud.fill"
        case "04n": return "cloud.fill"
        case "09d": return "cloud.drizzle.fill"
        case "09n": return "cloud.drizzle.fill"
        case "10d": return "cloud.sun.rain.fill"
        case "10n": return "cloud.moon.rain.fill"
        case "11d": return "cloud.bolt.rain.fill"
        case "11n": return "cloud.bolt.rain.fill"
        case "13d": return "snowflake"
        case "13n": return "snowflake"
        case "50d": return "cloud.fog.fill"
        case "50n": return "cloud.fog.fill"
        default:
            return "nosign"
        }
    }
    
    init?(weatherData: WeatherData) {
        cityName = weatherData.name
        temperature = weatherData.main.temp
        feelsLikeTempetature = weatherData.main.feelsLike
        tempMin = weatherData.main.tempMin
        tempMax = weatherData.main.tempMax
        pressure = weatherData.main.pressure
        humidity = weatherData.main.humidity
        description = weatherData.weather.first?.description
        windSpeed = weatherData.wind.speed
        iconCode = weatherData.weather.first?.icon
    }
}
