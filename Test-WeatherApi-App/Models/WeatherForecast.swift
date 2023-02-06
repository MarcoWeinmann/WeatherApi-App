//
//  WeatherForecast.swift
//  Test-WeatherApi-App
//
//  Created by Marco Weinmann on 01.02.23.
//

import Foundation

struct WeatherForecast: Decodable {
  
    
    
    
    var list: [List]
    var city: City
    
}
struct List: Decodable, Equatable {
    static func == (lhs: List, rhs: List) -> Bool {
        return true
    }
    
    var dt: Int
    var main: Main
    var weather: [Weather2]
    var dt_txt: String
    
}
        
        struct Main: Decodable {
            var temp_min: Double
            var temp_max: Double
            
        }
        
        struct Weather2: Decodable {
            
            var description: String
        //    var icon: Data
        }
    
    struct City: Decodable {
        var name: String
    }

