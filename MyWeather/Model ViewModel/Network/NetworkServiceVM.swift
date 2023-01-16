//
//  NetworkServiceVM.swift
//  MyWeather
//
//  Created by Рамиль Гирфанов on 15.01.2023.
//

import Foundation

class NetworkServiceVM: NetworkServiceProtocol {
    
    let model = NetworkService()
    
    func prepareProperties(lat: Double, lon: Double) {
        model.lat = lat
        model.lon = lon
    }
    
    func fetchData() {
//        Получает данные с сервера
        guard let url = URL(string: model.urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                
//                let dataString = String(data: data, encoding: .utf8)
//                print(dataString!)
            }
        }
        task.resume()
    }
}
