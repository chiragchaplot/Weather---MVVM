//
//  AddWeatherViewModel.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 16/7/21.
//

import Foundation

class AddWeatherViewModel {
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { (result) in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource)
                print("Chirag Country",weatherResource.sys.country)
                print("Chirag Name",weatherResource.name)
                completion(vm)
            }
            
        }
        
    }
}
