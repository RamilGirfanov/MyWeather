//
//  MainScreen.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 12.04.2023.
//

import UIKit

final class MainScreen: UIView {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UIObjects
    
    private let topWeatherView = TopWetherView()
    
    private let feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tempMinLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tempMaxLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pressureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [topWeatherView,
         feelsLikeLabel,
         windSpeedLabel,
         tempMinLabel,
         tempMaxLabel,
         pressureLabel,
         humidityLabel].forEach { addSubview($0) }
        
        let safeIndent1: CGFloat = 16
        let safeIndent2: CGFloat = 8
        
        NSLayoutConstraint.activate([
            topWeatherView.topAnchor.constraint(equalTo: topAnchor),
            topWeatherView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topWeatherView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            feelsLikeLabel.topAnchor.constraint(equalTo: topWeatherView.bottomAnchor, constant: safeIndent1),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            windSpeedLabel.topAnchor.constraint(equalTo: topWeatherView.bottomAnchor, constant: safeIndent2),
            windSpeedLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            tempMinLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: safeIndent1),
            tempMinLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            tempMaxLabel.topAnchor.constraint(equalTo: tempMinLabel.bottomAnchor, constant: safeIndent2),
            tempMaxLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            pressureLabel.topAnchor.constraint(equalTo: tempMaxLabel.bottomAnchor, constant: safeIndent1),
            pressureLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            humidityLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: safeIndent2),
            humidityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
        ])
    }
    
    
    
    func setupObjects() {
        #warning("Настроить")
        /*
        feelsLikeLabel.text =
        windSpeedLabel.text =
        tempMinLabel.text =
        tempMaxLabel.text =
        pressureLabel.text =
        humidityLabel.text =
        */
        topWeatherView.setupData()
        topWeatherView.setupColors()
    }
}
