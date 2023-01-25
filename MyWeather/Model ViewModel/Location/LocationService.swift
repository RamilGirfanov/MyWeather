//
//  LocationService.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 15.01.2023.
//

import Foundation
import CoreLocation

class LocationService {
    var lat: Double?
    var lon: Double?
        
//    MARK: - LocationManager
    
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()
}
