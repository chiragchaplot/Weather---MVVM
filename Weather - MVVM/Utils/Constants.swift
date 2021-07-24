//
//  Constants.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 16/7/21.
//

import Foundation

struct Constants{
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            let userDefaults = UserDefaults.standard
            let unit  = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&APPID=9a3874191d1fd428cd7781397bf6d8d2&units=\(unit)"
            return URL(string: url)!
        }
    }
}
