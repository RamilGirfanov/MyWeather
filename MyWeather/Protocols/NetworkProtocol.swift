//
//  NetworkProtocol.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 12.04.2023.
//

import Foundation

protocol NetworkProtocol {
    func getWeather(lat: Double,
                    lon: Double,
                    completionHeader: @escaping (Weather) -> Void)
}
