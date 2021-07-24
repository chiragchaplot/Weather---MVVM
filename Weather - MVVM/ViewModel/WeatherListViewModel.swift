//
//  WeatherViewModel.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 18/7/21.
//

import Foundation

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addweatherViewModel(_ WeatherViewModel: WeatherViewModel) {
        weatherViewModels.append(WeatherViewModel)
    }
    
    func numOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    func updateUnit(to unit: Unit) {
        switch  unit{
        case .celsius: toCelcius()
        case .fahrenheit: toFarhenheit()
        }
    }
    
    private func toCelcius() {
        weatherViewModels =  weatherViewModels.map{ vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature-32)*5/9
            return weatherModel
        }
    }
    
    private func toFarhenheit() {
        weatherViewModels =  weatherViewModels.map{ vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature*9/5)+32
            return weatherModel
        }
    }
    
}

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: Double

    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city: String {
        return weather.name
    }
    
}
