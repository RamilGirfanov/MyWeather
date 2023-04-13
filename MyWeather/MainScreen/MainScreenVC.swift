//
//  MainScreenVC.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 12.04.2023.
//

import UIKit

final class MainScreenVC: UIViewController {
    
    // MARK: - ViewModel

    private var mainScreenVM: MainScreenVMProtocol?
    
    
    // MARK: - View

    let mainScreen = MainScreen()
    
    
    
    // MARK: - init

    init(mainScreenVM: MainScreenVMProtocol) {
        self.mainScreenVM = mainScreenVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenVM?.getData()
        mainScreenVM?.updateView = { [weak self] weather in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.updateView(weather: weather)
            }
        }
    }
    
    // MARK: - Функционал

    private func updateView(weather: Weather) {
        mainScreen.setupObjects(weather: weather)
    }
}
