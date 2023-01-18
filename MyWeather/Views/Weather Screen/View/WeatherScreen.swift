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
            firstColor.red = 60
            firstColor.green = 7
            firstColor.blue = 132
            
            secontColor.red = 50
            secontColor.green = 4
            secontColor.blue = 114

            thridColor.red = 36
            thridColor.green = 2
            thridColor.blue = 91
            
            fourthColor.red = 20
            fourthColor.green = 1
            fourthColor.blue = 63
            
        case -39...(-30):
            firstColor.red = 42
            firstColor.green = 4
            firstColor.blue = 156
            
            secontColor.red = 53
            secontColor.green = 5
            secontColor.blue = 142

            thridColor.red = 60
            thridColor.green = 7
            thridColor.blue = 132
            
            fourthColor.red = 50
            fourthColor.green = 4
            fourthColor.blue = 114
            
        case -29...(-20):
            firstColor.red = 25
            firstColor.green = 24
            firstColor.blue = 241
            
            secontColor.red = 25
            secontColor.green = 13
            secontColor.blue = 212

            thridColor.red = 42
            thridColor.green = 4
            thridColor.blue = 156
            
            fourthColor.red = 53
            fourthColor.green = 5
            fourthColor.blue = 142
            
        case -19...(-10):
            firstColor.red = 53
            firstColor.green = 120
            firstColor.blue = 245
            
            secontColor.red = 34
            secontColor.green = 77
            secontColor.blue = 245

            thridColor.red = 25
            thridColor.green = 24
            thridColor.blue = 241
            
            fourthColor.red = 25
            fourthColor.green = 13
            fourthColor.blue = 212
            
        case -9...0:
            firstColor.red = 119
            firstColor.green = 221
            firstColor.blue = 224
            
            secontColor.red = 88
            secontColor.green = 187
            secontColor.blue = 243

            thridColor.red = 53
            thridColor.green = 120
            thridColor.blue = 245
            
            fourthColor.red = 34
            fourthColor.green = 77
            fourthColor.blue = 245
            
        case 1...9:
            firstColor.red = 88
            firstColor.green = 187
            firstColor.blue = 243
            
            secontColor.red = 119
            secontColor.green = 221
            secontColor.blue = 224

            thridColor.red = 99
            thridColor.green = 146
            thridColor.blue = 42
            
            fourthColor.red = 142
            fourthColor.green = 176
            fourthColor.blue = 53
            
        case 10...19:
            firstColor.red = 99
            firstColor.green = 146
            firstColor.blue = 42
            
            secontColor.red = 142
            secontColor.green = 17
            secontColor.blue = 53

            thridColor.red = 198
            thridColor.green = 210
            thridColor.blue = 69
            
            fourthColor.red = 235
            fourthColor.green = 221
            fourthColor.blue = 78

        case 20...29:
            firstColor.red = 198
            firstColor.green = 210
            firstColor.blue = 69
            
            secontColor.red = 235
            secontColor.green = 221
            secontColor.blue = 78

            thridColor.red = 229
            thridColor.green = 158
            thridColor.blue = 73
            
            fourthColor.red = 225
            fourthColor.green = 137
            fourthColor.blue = 67
            
        case 30...39:
            firstColor.red = 229
            firstColor.green = 158
            firstColor.blue = 73
            
            secontColor.red = 225
            secontColor.green = 137
            secontColor.blue = 67

            thridColor.red = 200
            thridColor.green = 77
            thridColor.blue = 57
            
            fourthColor.red = 158
            fourthColor.green = 46
            fourthColor.blue = 54
            
        case 40...:
            firstColor.red = 200
            firstColor.green = 77
            firstColor.blue = 57
            
            secontColor.red = 158
            secontColor.green = 46
            secontColor.blue = 54

            thridColor.red = 129
            thridColor.green = 34
            thridColor.blue = 48
            
            fourthColor.red = 119
            fourthColor.green = 30
            fourthColor.blue = 45
        default: break
        }

//        topContentView.backgroundColor = UIColor(red: , green: , blue: , alpha: 1)
        subViewForLocation.backgroundColor = UIColor(red: fourthColor.red, green: fourthColor.green, blue: fourthColor.blue, alpha: 1)
        locationLabel.backgroundColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        weatherImageView.backgroundColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
        temperatureLabel.backgroundColor = UIColor(red: firstColor.red, green: firstColor.green, blue: firstColor.blue, alpha: 1)
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
