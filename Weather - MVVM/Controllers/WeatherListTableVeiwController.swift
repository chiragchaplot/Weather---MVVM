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
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        print(vm)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let resource = Resource<WeatherResponse>(url: URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Melbourne&APPID=9a3874191d1fd428cd7781397bf6d8d2&units=imperial")!) { data in
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        
        Webservice().load(resource: resource) { weatherResponse in
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.cityNameLabel?.text = "Houston"
        cell.cityTempLabel?.text = "70°"
        return cell
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityVC(segue: segue)
        }
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
