//
//  WeatherCell.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 2/5/21.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.city
        self.cityTempLabel.text = "\(vm.temperature.formatAsDegree())"
    }
}
