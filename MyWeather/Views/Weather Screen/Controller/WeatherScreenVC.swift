//
//  WeatherScreenVC.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 13.01.2023.
//

import UIKit

class WeatherScreenVC: UIViewController {
    
//    MARK: - ViewModels
    
    let locationServiceVM = LocationServiceVM()
    let networkServiceVM = NetworkServiceVM()
    
    
//    MARK: - Экземпляр View
    
    lazy var weatherScreen = WeatherScreen()
    
    
//    MARK: - Lifecycle
    
    override func loadView() {
        view = weatherScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationServiceVM.getLocation()
        
        guard let lat = locationServiceVM.model.lat else { return }
        guard let lon = locationServiceVM.model.lon else { return }
        
        networkServiceVM.prepareProperties(lat: lat, lon: lon)
        
        networkServiceVM.fetchData()
        
        weatherScreen.settingColors()
    }


}
