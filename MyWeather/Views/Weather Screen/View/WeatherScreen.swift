//
//  WeatherScreen.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 16.01.2023.
//

import UIKit

class WeatherScreen: UIView {
    
//    MARK: - Colors
    
    var firstColor: WeatherColor?
    var secontColor: WeatherColor?
    var thridColor: WeatherColor?
    var fourthColor: WeatherColor?
    
    
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
    
    private let subViewForLocation: UIView = {
        let subViewForLocation = UIView()
        subViewForLocation.backgroundColor = .red
        subViewForLocation.layer.cornerRadius = 22
        subViewForLocation.translatesAutoresizingMaskIntoConstraints = false
        return subViewForLocation
    }()
        
//    let locationImageView: UIImageView = {
//        let locationImageView = UIImageView()
//        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
//        locationImageView.tintColor = .white
//        locationImageView.translatesAutoresizingMaskIntoConstraints = false
//        return locationImageView
//    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.text = "Санкт-Петербург"
        locationLabel.font = .systemFont(ofSize: 20, weight: .bold)
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
        
        [subViewForLocation, descriptionLabel, locationLabel, temperatureLabel, weatherImageView].forEach { topContentView.addSubview($0) }
        
        
        let safeIndent1: CGFloat = 16
        let safeIndent2: CGFloat = 8
        
        NSLayoutConstraint.activate([
            topContentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topContentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent2),
            topContentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent2),
            
            subViewForLocation.topAnchor.constraint(equalTo: topContentView.topAnchor),
            subViewForLocation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -22),
            subViewForLocation.trailingAnchor.constraint(lessThanOrEqualTo: weatherImageView.leadingAnchor, constant: -safeIndent1),
            subViewForLocation.heightAnchor.constraint(equalToConstant: 44),
                        
//            locationImageView.heightAnchor.constraint(equalToConstant: 35),
//            locationImageView.widthAnchor.constraint(equalToConstant: 35),
//            locationImageView.topAnchor.constraint(equalTo: subViewForLocation.topAnchor),
//            locationImageView.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
//            locationImageView.bottomAnchor.constraint(equalTo: subViewForLocation.bottomAnchor),
            
            locationLabel.centerYAnchor.constraint(equalTo: subViewForLocation.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: subViewForLocation.trailingAnchor, constant: -safeIndent1),
            
            descriptionLabel.topAnchor.constraint(equalTo: subViewForLocation.bottomAnchor, constant: safeIndent2),
            descriptionLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
            
            weatherImageView.heightAnchor.constraint(equalToConstant: 150),
            weatherImageView.widthAnchor.constraint(equalToConstant: 150),
            weatherImageView.topAnchor.constraint(equalTo: topContentView.topAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: safeIndent1),
            temperatureLabel.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -safeIndent2),
            
            topBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBackgroundView.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor),
            
        ])
    }
    
    
//    MARK: - Setting
        
    func settingColors() {
//        topContentView.backgroundColor = UIColor(red: , green: , blue: , alpha: 1)
        subViewForLocation.backgroundColor = UIColor(red: fourthColor?.red ?? <#default value#>, green: fourthColor?.green ?? <#default value#>, blue: fourthColor?.blue ?? <#default value#>, alpha: 1)
        locationLabel.backgroundColor = UIColor(red: firstColor?.red ?? <#default value#>, green: firstColor?.green ?? <#default value#>, blue: firstColor?.blue ?? <#default value#>, alpha: 1)
        weatherImageView.backgroundColor = UIColor(red: firstColor?.red ?? <#default value#>, green: firstColor?.green ?? <#default value#>, blue: firstColor?.blue ?? <#default value#>, alpha: 1)
        temperatureLabel.backgroundColor = UIColor(red: firstColor?.red ?? <#default value#>, green: firstColor?.green ?? <#default value#>, blue: firstColor?.blue ?? <#default value#>, alpha: 1)
    }
    
    
//    MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
