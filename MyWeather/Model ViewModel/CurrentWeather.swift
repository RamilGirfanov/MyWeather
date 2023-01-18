//
//  CurrentWeather.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 17.01.2023.
//

import Foundation

struct CurrentWeater {
    let cityName: String
    
    let tempetature: Double
    var temperatureString: String {
        return String(format: "%.0f", tempetature)
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

    let conditionCode: Int
    let descriptionWeather: String
    
    let windSpeed: Double
    var windSpeedString: String {
        return String(format: "%.0f", windSpeed)
    }
    
    init?(curentWeatherData: CurrentWeatherData) {
        cityName = curentWeatherData.name
        tempetature = curentWeatherData.main.temp
        feelsLikeTempetature = curentWeatherData.main.feelsLike
        tempMin = curentWeatherData.main.tempMin
        tempMax = curentWeatherData.main.tempMax
        conditionCode = curentWeatherData.weather.first!.id
        windSpeed = curentWeatherData.wind.speed
    }
}
