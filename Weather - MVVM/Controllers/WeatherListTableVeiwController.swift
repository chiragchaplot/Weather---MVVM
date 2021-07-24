//
//  WeatherListTableVeiwController.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 2/5/21.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addweatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //Get unit
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let vm = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(vm)
        return cell
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityVC(segue: segue)
        }
        
        else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableVC(segue: segue)
        }
    }
    
    func prepareSegueForSettingsTableVC(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else  {
            fatalError("Navigation Controller Not Found")
        }
        guard let settingsTableVC = nav.viewControllers.first as? SettingsTableViewController else  {
            fatalError("SettingsTableViewController Not Found")
        }
        settingsTableVC.delegate = self
    }
    
    func prepareSegueForAddWeatherCityVC(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else  {
            fatalError("Navigation Controller Not Found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? addWeatherCityViewController else  {
            fatalError("addWeatherCityViewController Not Found")
        }
        addWeatherCityVC.delegate = self
    }
    
}

extension WeatherListTableViewController: settingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)
        }
    }
}
