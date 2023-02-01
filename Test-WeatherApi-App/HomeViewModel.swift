//
//  HomeViewModel.swift
//  Test-WeatherApi-App
//
//  Created by Marco Weinmann on 17.01.23.
//

import Foundation

class HomeViewModel {
    var weather: Weather?
    var weatherForecast: WeatherForecast?
    
    private var main: Weather.Main? {
        return weather?.main
    }
    //HeaderString
    var nameString: String {
        return String(weather?.name ?? "")
    }
    
    var temperatureString: String {
        return displayableFahrenheitTemperature(weather?.temp ?? 0)
    }
    
    
    // SubHeaderStrings
    var feelsLikeTemperatureString: String {
        return displayableFahrenheitTemperature(weather?.feelsLike ?? 0)
    }
    
    var minTemperatureString: String {
        return displayableFahrenheitTemperature(weather?.minTemperature ?? 0)
    }
    var maxTemperatureString: String {
        return displayableFahrenheitTemperature(weather?.maxTemperature ?? 0)
    }
    
    var pressureString: String {
        return String (format: "%.1f", weather?.pressure ?? 0)
    }
    var humidityString: String {
        return String (format: "%.1f", weather?.humidity ?? 0)
    }
    
    //Forecast Data
    var date: Int {
        
        return (weatherForecast?.list[0].dt)!
//        (String(format: "%.1f", weatherForecast?.list[0].dt  ?? 0))!
    }
    
    var tempMinStringForecast: Double {
        return Double (String(format: "%.1f", weatherForecast?.list[1].main.temp_min ?? 0))!
    }
    
    var tempMaxStringForecast: Double {
        return Double (String(format: "%.1f", weatherForecast?.list[1].main.temp_max ?? 0))!
    }
    
    var descriptionString: String {
        return String (format: "%.1f", weatherForecast?.list[1].weather[1].description ?? 0)
    }
    
    
    
    // Helpers
    private func displayableFahrenheitTemperature(_ temperatureAsKelvin: Double) -> String {
        return String(format: "%.1f", temperatureAsKelvin) + " °C"
    }
    
    
    
    func fetchWeather(for name: String, _ completion: @escaping (() -> Void)) {
        NetworkController.fetchWeather(for: name) { weather in
            self.weather = weather
            completion()
        }
        
    }
    
    func fetchWeatherForecast(for name: String, _ completion: @escaping (() -> Void)) {
        ForecastNetworkController.fetchWeather(for: name) { weather in
            self.weatherForecast = weather
            completion()
        }
        
    }
    
}
