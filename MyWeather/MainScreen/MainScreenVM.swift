//
//  MainScreenVM.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 12.04.2023.
//

import Foundation

final class MainScreenMV: MainScreenVMProtocol {
    
    // MARK: - Models
    
    let network = NetWork.shared
    
    
    
    
    // MARK: - MainScreenVMProtocol
    
    func getData() {
        network.getWeather(lat: 60.002, lon: 30.3891) { [weak self] weather in
            guard let self = self else { return }
            self.updateView(weather)
        }
    }
    
    var updateView: (Weather) -> Void = { _ in }
    
    
}
