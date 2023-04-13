//
//  Network.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 13.04.2023.
//

import Foundation

final class Network: NetworkProtocol {
    static let shared = Network()
    private init() {}
    
    private var lat: Double = 0
    private var lon: Double = 0
    private let appid = "2fab07c5843f46e80cdcbdd7b4a643a7"
    private let lang = "ru"
    
    private var cityName: String?
    
    lazy var urlLocationString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(appid)&lang=\(lang)&units=metric"
    
    lazy var urlTranslateString = "https://api.openweathermap.org/geo/1.0/reverse?lat=\(lat)&lon=\(lon)&appid=\(appid)"
    
    
    
    private func parseJSON(data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            let weather = Weather(weatherData: weatherData)
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    // MARK: - NetworkProtocol
    
    func getWeather(lat: Double, lon: Double, completionHeader: @escaping (Weather) -> Void) {
        self.lat = lat
        self.lon = lon
        
        guard let url = URL(string: urlLocationString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("URL: \(url) \nОшибка при выполнении GET запроса: \(error.localizedDescription)")
                return
            }
            
            guard
                let data = data,
                var weather = self.parseJSON(data: data)
            else {
                return
            }
            
           completionHeader(weather)
        }
        task.resume()
    }

}
