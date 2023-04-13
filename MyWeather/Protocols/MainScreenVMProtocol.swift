//
//  MainScreenVMProtocol.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 12.04.2023.
//

import Foundation

protocol MainScreenVMProtocol {
    func getData()
    
    var updateView: (Weather) -> Void { get set }
}
