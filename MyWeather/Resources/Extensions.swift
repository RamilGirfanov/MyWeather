//
//  Extensions.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 12.04.2023.
//

import UIKit

// Расшитение типа Double для перевода значения в String
extension Double {
    var toString: String? {
        String(format: "%.0f", self)
    }
}
