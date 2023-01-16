//
//  WeatherScreenVC.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 13.01.2023.
//

import UIKit

class WeatherScreenVC: UIViewController {
    
    let locationServiceVM = LocationServiceVM()
    let networkServiceVM = NetworkServiceVM()
    
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationServiceVM.getLocation()
        
        guard let lat = locationServiceVM.model.lat else { return }
        guard let lon = locationServiceVM.model.lon else { return }
        
        networkServiceVM.prepareProperties(lat: lat, lon: lon)
        
        networkServiceVM.fetchData()

    }


}
