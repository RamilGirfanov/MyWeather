//
//  TopWetherView.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 12.04.2023.
//

import UIKit

final class TopWetherView: UIView {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UIObjects
    
    private let topBackgroundView: UIView = {
        let topBackgroundView = UIView()
        topBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        return topBackgroundView
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
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "mappin.circle")
        image.tintColor = .white
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
    
    
    // MARK: - Layout
    
    private func layout() {
        [subViewForLocation,
         descriptionLabel,
         weatherImage,
         temperatureLabel,
         locationLabel,
         locationImage].forEach { addSubview($0) }
        
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
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -safeIndent1),
            
            locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -safeIndent1),
            locationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            
            locationImage.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -safeIndent2),
            locationImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
        ])
    }
    
    
    // MARK: - SetupData
    
    func setupData(weather: Weather) {
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
        
        layoutIfNeeded()
    }
    
    
    // MARK: - SetupColors
    
    func setupColors() {
        
    }
}
