//
//  ForecastNetworkController.swift
//  Test-WeatherApi-App
//
//  Created by Marco Weinmann on 01.02.23.
//

import Foundation

struct ForecastNetworkController {
    
    private static var baseUrl = "api.openweathermap.org"
    private static var path = "/data/2.5/forecast"
    
    private static let apiKey = "58d5d4c2e2b529e0a911530cfa95e58e"
    
    enum Endpoint {
        case cityName(path: String, name: String)
        
        var url: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = baseUrl
            components.path = path
            components.queryItems = queryItems
            
            return components.url
        }
        
        private var path: String{
            switch self {
            case .cityName(let path, _):
                return path
            }
        }
        
        private var queryItems: [URLQueryItem] {
            
            var queryItems = [URLQueryItem]()
            switch self {
            case .cityName(_, let name):
                queryItems.append(URLQueryItem(name: "q", value: String(name)))
            }
            queryItems.append(URLQueryItem(name: "units", value: "metric"))
            queryItems.append(URLQueryItem(name: "appid", value: apiKey))
            
            return queryItems
        }
    }
    
    static func fetchWeather(for name: String, _ completion: @escaping ((WeatherForecast) -> Void)) {
        
        if let url = Endpoint.cityName(path: path, name: name).url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error", error)
                }
                
                if let data = data {
                    
                    do {
                        let weather = try JSONDecoder().decode(WeatherForecast.self, from: data)
                        completion(weather)
                    }catch let error {
                        print ("failed to decode object...", error)
                    }
                    
                }
            }.resume()
            
        }
    }
}

