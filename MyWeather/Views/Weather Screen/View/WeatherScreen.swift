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
    
    private let subViewForLocation: UIView = {
        let subViewForLocation = UIView()
        subViewForLocation.backgroundColor = .red
        subViewForLocation.layer.cornerRadius = 22
        subViewForLocation.translatesAutoresizingMaskIntoConstraints = false
        return subViewForLocation
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = .systemFont(ofSize: 20, weight: .bold)
        locationLabel.textColor = .white
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 20)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    let feelsLikeTempetatureLabel: UILabel = {
        let feelsLikeTempetatureLabel = UILabel()
        feelsLikeTempetatureLabel.font = .systemFont(ofSize: 20)
        feelsLikeTempetatureLabel.textColor = .white
        feelsLikeTempetatureLabel.translatesAutoresizingMaskIntoConstraints = false
        return feelsLikeTempetatureLabel
    }()
    
    let minMaxTempLabel: UILabel = {
        let minMaxTempLabel = UILabel()
        minMaxTempLabel.font = .systemFont(ofSize: 20)
        minMaxTempLabel.textColor = .white
        minMaxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return minMaxTempLabel
    }()
    
    let windSpeedLabel: UILabel = {
        let windSpeedLabel = UILabel()
        windSpeedLabel.font = .systemFont(ofSize: 20)
        windSpeedLabel.textColor = .white
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        return windSpeedLabel
    }()
    
    let humidityLabel: UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.font = .systemFont(ofSize: 20)
        humidityLabel.textColor = .white
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        return humidityLabel
    }()
    
    let temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = .systemFont(ofSize: 50)
        temperatureLabel.textColor = .white
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        return temperatureLabel
    }()
    
    let weatherImageView: UIImageView = {
        let weatherImageView = UIImageView()
        weatherImageView.image = UIImage(systemName: "cloud.rain.fill")
        weatherImageView.contentMode = .scaleAspectFit
        weatherImageView.tintColor = .white
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        return weatherImageView
    }()
    
    
//    MARK: - Layout
    
    private func layout() {
        [topBackgroundView, topContentView].forEach { addSubview($0) }
        
        [subViewForLocation, descriptionLabel, feelsLikeTempetatureLabel, minMaxTempLabel, windSpeedLabel, humidityLabel, locationLabel, temperatureLabel, weatherImageView].forEach { topContentView.addSubview($0) }
        
        
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
            descriptionLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: -safeIndent2),
            
            feelsLikeTempetatureLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: safeIndent2),
            feelsLikeTempetatureLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
            
            minMaxTempLabel.topAnchor.constraint(equalTo: feelsLikeTempetatureLabel.bottomAnchor, constant: safeIndent2),
            minMaxTempLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
            
            windSpeedLabel.topAnchor.constraint(equalTo: minMaxTempLabel.bottomAnchor, constant: safeIndent2),
            windSpeedLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
            
            humidityLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: safeIndent2),
            humidityLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor),
            
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
        
    func settingColors(temp: Int) {
        var firstColor = WeatherColor()
        var secontColor = WeatherColor()
        var thridColor = WeatherColor()
        var fourthColor = WeatherColor()
        
        switch temp {
        case ...(-40):
            firstColor.red = 60 / 255
            firstColor.green = 7 / 255
            firstColor.blue = 132 / 255
            
            secontColor.red = 50 / 255
            secontColor.green = 4 / 255
            secontColor.blue = 114 / 255
            
            thridColor.red = 36 / 255
            thridColor.green = 2 / 255
            thridColor.blue = 91 / 255
            
            fourthColor.red = 20 / 255
            fourthColor.green = 1 / 255
            fourthColor.blue = 63 / 255
            
        case -39...(-30):
            firstColor.red = 42 / 255
            firstColor.green = 4 / 255
            firstColor.blue = 156 / 255
            
            secontColor.red = 53 / 255
            secontColor.green = 5 / 255
            secontColor.blue = 142 / 255
            
            thridColor.red = 60 / 255
            thridColor.green = 7 / 255
            thridColor.blue = 132 / 255
            
            fourthColor.red = 50 / 255
            fourthColor.green = 4 / 255
            fourthColor.blue = 114 / 255
            
        case -29...(-20):
            firstColor.red = 25 / 255
            firstColor.green = 24 / 255
            firstColor.blue = 241 / 255
            
            secontColor.red = 25 / 255
            secontColor.green = 13 / 255
            secontColor.blue = 212 / 255
            
            thridColor.red = 42 / 255
            thridColor.green = 4 / 255
            thridColor.blue = 156 / 255
            
            fourthColor.red = 53 / 255
            fourthColor.green = 5 / 255
            fourthColor.blue = 142 / 255
            
        case -19...(-10):
            firstColor.red = 53 / 255
            firstColor.green = 120 / 255
            firstColor.blue = 245 / 255
            
            secontColor.red = 34 / 255
            secontColor.green = 77 / 255
            secontColor.blue = 245 / 255
            
            thridColor.red = 25 / 255
            thridColor.green = 24 / 255
            thridColor.blue = 241 / 255
            
            fourthColor.red = 25 / 255
            fourthColor.green = 13 / 255
            fourthColor.blue = 212 / 255
            
        case -9...0:
            firstColor.red = 119 / 255
            firstColor.green = 221 / 255
            firstColor.blue = 224 / 255
            
            secontColor.red = 88 / 255
            secontColor.green = 187 / 255
            secontColor.blue = 243 / 255
            
            thridColor.red = 53 / 255
            thridColor.green = 120 / 255
            thridColor.blue = 245 / 255
            
            fourthColor.red = 34 / 255
            fourthColor.green = 77 / 255
            fourthColor.blue = 245 / 255
            
        case 1...9:
            firstColor.red = 88 / 255
            firstColor.green = 187 / 255
            firstColor.blue = 243 / 255
            
            secontColor.red = 119 / 255
            secontColor.green = 221 / 255
            secontColor.blue = 224 / 255
            
            thridColor.red = 99 / 255
            thridColor.green = 146 / 255
            thridColor.blue = 42 / 255
            
            fourthColor.red = 142 / 255
            fourthColor.green = 176 / 255
            fourthColor.blue = 53 / 255
            
        case 10...19:
            firstColor.red = 99 / 255
            firstColor.green = 146 / 255
            firstColor.blue = 42 / 255
            
            secontColor.red = 142 / 255
            secontColor.green = 17 / 255
            secontColor.blue = 53 / 255
            
            thridColor.red = 198 / 255
            thridColor.green = 210 / 255
            thridColor.blue = 69 / 255
            
            fourthColor.red = 235 / 255
            fourthColor.green = 221 / 255
            fourthColor.blue = 78 / 255
            
        case 20...29:
            firstColor.red = 198 / 255
            firstColor.green = 210 / 255
            firstColor.blue = 69 / 255
            
            secontColor.red = 235 / 255
            secontColor.green = 221 / 255
            secontColor.blue = 78 / 255
            
            thridColor.red = 229 / 255
            thridColor.green = 158 / 255
            thridColor.blue = 73 / 255
            
            fourthColor.red = 225 / 255
            fourthColor.green = 137 / 255
            fourthColor.blue = 67 / 255
            
        case 30...39:
            firstColor.red = 229 / 255
            firstColor.green = 158 / 255
            firstColor.blue = 73 / 255
            
            secontColor.red = 225 / 255
            secontColor.green = 137 / 255
            secontColor.blue = 67 / 255
            
            thridColor.red = 200 / 255
            thridColor.green = 77 / 255
            thridColor.blue = 57 / 255
            
            fourthColor.red = 158 / 255
            fourthColor.green = 46 / 255
            fourthColor.blue = 54 / 255
            
        case 40...:
            firstColor.red = 200 / 255
            firstColor.green = 77 / 255
            firstColor.blue = 57 / 255
            
            secontColor.red = 158 / 255
            secontColor.green = 46 / 255
            secontColor.blue = 54 / 255
            
            thridColor.red = 129 / 255
            thridColor.green = 34 / 255
            thridColor.blue = 48 / 255
            
            fourthColor.red = 119 / 255
            fourthColor.green = 30 / 255
            fourthColor.blue = 45 / 255
        default: break
        }

        topBackgroundView.backgroundColor = UIColor(red: thridColor.red , green: thridColor.green, blue: thridColor.blue, alpha: 1)
        subViewForLocation.backgroundColor = UIColor(red: fourthColor.red, green: fourthColor.green, blue: fourthColor.blue, alpha: 1)
        locationLabel.textColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        descriptionLabel.textColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        feelsLikeTempetatureLabel.textColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        minMaxTempLabel.textColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        windSpeedLabel.textColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        humidityLabel.textColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        weatherImageView.tintColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        temperatureLabel.textColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
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
