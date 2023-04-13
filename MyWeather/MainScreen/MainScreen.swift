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
    
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupColors()
    }
    
    
    // MARK: - UIObjects
    
    private let topBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subViewForLocation: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let weatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "cloud.rain.fill")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "mappin.circle")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        [topBackgroundView,
         subViewForLocation,
         descriptionLabel,
         weatherImage,
         temperatureLabel,
         locationLabel,
         locationImage,
         feelsLikeLabel,
         windSpeedLabel,
         tempMinLabel,
         tempMaxLabel,
         pressureLabel,
         humidityLabel].forEach { addSubview($0) }
        
        let safeIndent1: CGFloat = 16
        let safeIndent2: CGFloat = 8
        
        NSLayoutConstraint.activate([
            subViewForLocation.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            subViewForLocation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -22),
            subViewForLocation.trailingAnchor.constraint(lessThanOrEqualTo: weatherImage.leadingAnchor, constant: -safeIndent1),
            subViewForLocation.heightAnchor.constraint(equalToConstant: 44),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: subViewForLocation.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            descriptionLabel.trailingAnchor.constraint(equalTo: subViewForLocation.trailingAnchor, constant: -safeIndent1),
            
            weatherImage.heightAnchor.constraint(equalToConstant: 150),
            weatherImage.widthAnchor.constraint(equalToConstant: 150),
            weatherImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent1),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: safeIndent1),
            temperatureLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent1),
            
            locationLabel.bottomAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            locationImage.heightAnchor.constraint(equalToConstant: 30),
            locationImage.widthAnchor.constraint(equalToConstant: 30),
            locationImage.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -safeIndent2),
            locationImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            feelsLikeLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: safeIndent1),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            windSpeedLabel.topAnchor.constraint(equalTo: feelsLikeLabel.bottomAnchor, constant: safeIndent2),
            windSpeedLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            tempMinLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: safeIndent1),
            tempMinLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            tempMaxLabel.topAnchor.constraint(equalTo: tempMinLabel.bottomAnchor, constant: safeIndent2),
            tempMaxLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            pressureLabel.topAnchor.constraint(equalTo: tempMaxLabel.bottomAnchor, constant: safeIndent1),
            pressureLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            humidityLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: safeIndent2),
            humidityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            topBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBackgroundView.bottomAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: safeIndent2)
        ])
    }
    
    
    // MARK: - Функционал
    
    
    func setupColors() {
        lazy var gradient: CAGradientLayer = {
            let gradient = CAGradientLayer()
            gradient.type = .axial
            gradient.colors = [
                UIColor.orange.cgColor,
                UIColor.red.cgColor
            ]
            gradient.locations = [0, 1]
            return gradient
        }()
        
        gradient.frame = topBackgroundView.bounds
        topBackgroundView.layer.addSublayer(gradient)
    }
    
    func setupObjects(weather: Weather) {
        if let description = weather.description {
            descriptionLabel.text = description
        }
        
        if let image = weather.systeemIconNameString {
            weatherImage.image = UIImage(systemName: image)
        }
        
        if let temperature = weather.temperature {
            temperatureLabel.text = "\(temperature)º"
        }
        
        if let location = weather.cityName {
            locationLabel.text = location
        }
        
        if let feelsLikeTempetature = weather.feelsLikeTempetature?.rounded() {
            feelsLikeLabel.text = "Ощущается как \(feelsLikeTempetature)º"
        }
        
        if let windSpeed = weather.windSpeed?.rounded() {
            windSpeedLabel.text = "Скорость ветра \(windSpeed)"
        }
        if let tempMin = weather.tempMin {
            tempMinLabel.text = "Минимальная температура \(tempMin)"
        }
        
        if let tempMax = weather.tempMax {
            tempMaxLabel.text = "Минимальная температура \(tempMax)"
        }
        
        if let pressure = weather.pressure {
            pressureLabel.text = "Давление \(pressure)"
        }
        
        if let humidity = weather.humidity {
            pressureLabel.text = "Давление \(humidity)"
        }
    }
}
