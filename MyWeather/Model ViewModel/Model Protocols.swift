//
//  Model Protocols.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 14.01.2023.
//

import Foundation

protocol LocationServiceProtocol {
    func getLocation()
    func translateLocation() -> String
}

protocol NetworkServiceProtocol {
    func prepareProperties(lat: Double, lon: Double)
    func fetchData()
}
