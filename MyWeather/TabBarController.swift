//
//  TabBarController.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 13.01.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTBC()
    }
    
    private func setupTBC() {
        let weatherScreenVC = WeatherScreenVC()
        
        viewControllers = [weatherScreenVC]
    }
}
