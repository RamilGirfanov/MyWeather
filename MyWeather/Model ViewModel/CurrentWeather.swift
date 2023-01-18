//
//  CurrentWeather.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 17.01.2023.
//

import Foundation

struct CurrentWeater {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let feelsLikeTempetature: Double
    var feelsLikeTempetatureString: String {
        return String(format: "%.0f", feelsLikeTempetature)
    }
    
    let tempMin: Double
    var tempMinString: String {
        return String(format: "%.0f", tempMin)
    }
    
    let tempMax: Double
    var tempMaxString: String {
        return String(format: "%.0f", tempMax)
    }
    
    let humidity: Int

    let iconCode: String
    var systeemIconNameString: String {
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
        
    let description: String
    
    let windSpeed: Double
    var windSpeedString: String {
        return String(format: "%.0f", windSpeed)
    }
    
    init?(curentWeatherData: CurrentWeatherData) {
        cityName = curentWeatherData.name
        temperature = curentWeatherData.main.temp
        feelsLikeTempetature = curentWeatherData.main.feelsLike
        tempMin = curentWeatherData.main.tempMin
        tempMax = curentWeatherData.main.tempMax
        humidity = curentWeatherData.main.humidity
        iconCode = curentWeatherData.weather.first!.icon
        description = curentWeatherData.weather.first!.description
        windSpeed = curentWeatherData.wind.speed
    }
}
