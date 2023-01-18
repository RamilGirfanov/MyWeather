//
//  LocationServiceVM.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 15.01.2023.
//

import Foundation
import CoreLocation

class LocationServiceVM: NSObject, LocationServiceProtocol, CLLocationManagerDelegate {
    
//    MARK: - Model
    
    let model = LocationService()
    
    
//    MARK: - Location
    
    let locationManager = CLLocationManager()
    
    
//    MARK: - Methods
    
    func getLocation() {
        model.lat = locationManager.location?.coordinate.latitude
        model.lon = locationManager.location?.coordinate.longitude        
    }
    
    func translateLocation() -> String {
//        Преобразует координаты в населенный пункт
        
        return "пока так"
    }
    
    
//    MARK: - init
    
    override init() {
        super.init()
        locationManager.requestWhenInUseAuthorization()
    }
}

