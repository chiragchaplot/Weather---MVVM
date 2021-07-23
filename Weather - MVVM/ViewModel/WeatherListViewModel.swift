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
    
    func numOfRows() -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
}

class WeatherViewModel {
    let weather: WeatherResponse
    
    init(weather: WeatherResponse) {
        self.weather = weather
    }
    
    var city: String {
        return weather.name
    }
    
    var temperature: Double {
        return weather.main.temp
    }
}
