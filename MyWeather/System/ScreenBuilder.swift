//
//  ScreenBuilder.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 13.04.2023.
//

import UIKit

enum Models {
    
}

final class ScreenBuilder {
    static let shared = ScreenBuilder()
    private init() {}
    
    func makeMainScreenVC() -> UIViewController {
        let mainScreenVM = MainScreenMV()
        let mainScreenVC = MainScreenVC(mainScreenVM: mainScreenVM)
        mainScreenVC.tabBarItem.image = UIImage(systemName: "cloud.sun.fill")
        return mainScreenVC
    }
}
