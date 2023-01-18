//
//  WeatherScreenVC.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 13.01.2023.
//

import UIKit

class WeatherScreenVC: UIViewController {
    
//    MARK: - ViewModels
    
    var locationServiceVM = LocationServiceVM()
    var networkServiceVM = NetworkServiceVM()
    
    
//    MARK: - Экземпляр View
    
    lazy var weatherScreen = WeatherScreen()
    
    
//    MARK: - Lifecycle
    
    override func loadView() {
        view = weatherScreen
    }
    
    private func updateInterface(weather: CurrentWeater) {
        DispatchQueue.main.async { [self] in
            weatherScreen.locationLabel.text = weather.cityName
            weatherScreen.descriptionLabel.text = weather.description
            weatherScreen.feelsLikeTempetatureLabel.text = "Ощущается как: \(Int(weather.feelsLikeTempetature.rounded()))ºC"
            weatherScreen.minMaxTempLabel.text = "Мин.: \(Int(weather.tempMin.rounded()))ºC, макс.: \(Int(weather.tempMax.rounded()))ºC"
            weatherScreen.windSpeedLabel.text = "Ветер: \(Int(weather.windSpeed.rounded())) м/с"
            weatherScreen.humidityLabel.text = "Влажность: \(weather.humidity) %"
            weatherScreen.temperatureLabel.text = "\(Int(weather.temperature.rounded()))ºC"
            weatherScreen.weatherImageView.image = UIImage(systemName: weather.systeemIconNameString)
            
            weatherScreen.settingColors(temp: Int(weather.temperature.rounded()))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationServiceVM.getLocation()
        
        guard let lat = locationServiceVM.model.lat else { return }
        guard let lon = locationServiceVM.model.lon else { return }
        
        networkServiceVM.prepareProperties(lat: lat, lon: lon)
        
        networkServiceVM.fetchData()
        
        networkServiceVM.onCompletion = { [weak self] currentWeater in
            guard let self = self else { return }
            self.updateInterface(weather: currentWeater)
        }
        
    }

}
