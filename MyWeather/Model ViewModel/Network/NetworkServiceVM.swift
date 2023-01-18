//
//  NetworkServiceVM.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 15.01.2023.
//

import Foundation

class NetworkServiceVM: NetworkServiceProtocol {
    
    let model = NetworkService()
    
    var onCompletion: ((CurrentWeater) -> Void)?
    
    func prepareProperties(lat: Double, lon: Double) {
        model.lat = lat
        model.lon = lon
    }
    
    func fetchData() {
//        Получает данные с сервера
        guard let url = URL(string: model.urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let data = data {
                if let currentWeather = self.parseJSON(data: data){
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(data: Data) -> CurrentWeater? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeater(curentWeatherData: currentWeatherData) else { return nil }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
