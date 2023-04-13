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

struct CustonColors {
    var firstColor: UIColor = .white
    var secondColor: UIColor = .white
    var thridColor: UIColor = .white
    var fourthColor: UIColor = .white
    
    func setupColors(temp: Int) {
        switch temp {
        case ...(-40):
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case -39...(-30):
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case -29...(-20):
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case -19...(-10):
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case -9...0:
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case 1...9:
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case 10...19:
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case 20...29:
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case 30...39:
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        case 40...:
            firstColor.red =
            secondColor.blue =
            thridColor.red =
            fourthColor.blue =
            
        default: break
        }
    }
}
