//
//  NetworkServiceVM.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 15.01.2023.
//
/*
import Foundation

class NetworkServiceVM: NetworkServiceProtocol {
    
    let model = NetworkService()
    
    var onCompletion: ((Weather) -> Void)?
    
    func prepareProperties(lat: Double, lon: Double) {
        model.lat = lat
        model.lon = lon
    }
    
    
    func fetchData() {
//        Получает данные с сервера
        guard let url = URL(string: model.urlLocationString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let data = data {
                if let currentWeather = self.parseWeatherJSON(data: data){
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    
    func parseWeatherJSON(data: Data) -> CurrentWeater? {
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
    
    
    func translateLocation() {
        //        Преобразует координаты в населенный пункт
        
        guard let url = URL(string: model.urlTranslateString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { [weak self] data, responce, error in
            guard let self = self else { return }
            if let data = data {
//                print(String(data: data, encoding: .utf8))
                    if let currentLocation = self.parseLocationJSON(data: data) {
                        self.model.cityName = currentLocation.cityName                    
                }
            }
        }
        task.resume()
    }

    func parseLocationJSON(data: Data) -> CurrentLocation? {
        let decoder = JSONDecoder()
        do {
            let currentLocationData = try decoder.decode(CurrentLocationData.self, from: data)
            guard let currentLocation = CurrentLocation(curentLocationData: currentLocationData) else { return nil }
            return currentLocation
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
*/
