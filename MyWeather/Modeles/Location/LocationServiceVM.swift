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
        
    
//    MARK: - Methods
    
    func getLocation() {
//        model.locationManager.requestLocation()
        model.lat = model.locationManager.location?.coordinate.latitude
        model.lon = model.locationManager.location?.coordinate.longitude
    }
    
    
//    MARK: - init
    
    override init() {
        super.init()
        model.locationManager.delegate = self
    }
}


