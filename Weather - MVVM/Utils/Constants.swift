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
            let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&APPID=9a3874191d1fd428cd7781397bf6d8d2&units=metric"
            return URL(string: url)!
        }
    }
}
