//
//  AddWeatherCityVC.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 2/5/21.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave (vm: WeatherViewModel)
}

class addWeatherCityViewController: UIViewController {
    
    private var addWeatherVM = AddWeatherViewModel()
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city) {
                (vm) in
                
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
