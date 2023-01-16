//
//  WeatherScreen.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 16.01.2023.
//

import UIKit

class WeatherScreen: UIView {
    
//    MARK: - UIObjects
    
    private let topBackgroundView: UIView = {
        let topView = UIView()
        topView.backgroundColor = .orange
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
    private let topContentView: UIView = {
        let topContentView = UIView()
        topContentView.backgroundColor = .clear
        topContentView.translatesAutoresizingMaskIntoConstraints = false
        return topContentView
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Пасмурно"
        descriptionLabel.font = .systemFont(ofSize: 20)
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    let locationImageView: UIImageView = {
        let locationImageView = UIImageView()
        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        locationImageView.tintColor = .white
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        return locationImageView
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.text = "Санкт-Петербург"
        locationLabel.font = .systemFont(ofSize: 20)
        locationLabel.textColor = .white
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationLabel
    }()
    
    let temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.text = "+15ºC"
        temperatureLabel.font = .systemFont(ofSize: 50)
        temperatureLabel.textColor = .white
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        return temperatureLabel
    }()
    
    let weatherImageView: UIImageView = {
        let weatherImageView = UIImageView()
        weatherImageView.image = UIImage(systemName: "cloud.rain.fill")
        weatherImageView.tintColor = .white
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        return weatherImageView
    }()
    
    
//    MARK: - Layout
    
    private func layout() {
        [topBackgroundView, topContentView].forEach { addSubview($0) }
        
        [descriptionLabel, locationImageView, locationLabel, temperatureLabel, weatherImageView].forEach { topContentView.addSubview($0) }
        
        
        let safeIndent1: CGFloat = 16
        let safeIndent2: CGFloat = 8
        
        NSLayoutConstraint.activate([
            topContentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topContentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent2),
            topContentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent2),
            
            weatherImageView.heightAnchor.constraint(equalToConstant: 150),
            weatherImageView.widthAnchor.constraint(equalToConstant: 150),
            weatherImageView.topAnchor.constraint(equalTo: topContentView.topAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: safeIndent1),
            temperatureLabel.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -safeIndent2),
            
            
            descriptionLabel.centerYAnchor.constraint(equalTo: weatherImageView.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),

            
            locationLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -safeIndent2),

            locationImageView.heightAnchor.constraint(equalToConstant: 44),
            locationImageView.widthAnchor.constraint(equalToConstant: 44),
            locationImageView.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
            locationImageView.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -safeIndent2),
            

            topBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBackgroundView.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor),
//            topBackgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
            
            
        ])
    }
    
    
//    MARK: - Setting
    
    func settingUIObjects() {
        
    }
    
    
//    MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        settingUIObjects()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
