//
//  SettingsViewController.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 23/7/21.
//

import Foundation

import UIKit

protocol settingsDelegate {
    func settingsDone( vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    private var settingsVM = SettingsViewModel()
    var delegate: settingsDelegate?
    
    @IBAction func doneButtonPressed() {
        if let delegate = self.delegate {
            delegate.settingsDone(vm: settingsVM)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Chirag","SettingsVM")
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //uncheck all cells
        tableView.visibleCells.forEach() { cell in
            cell.accessoryType = .none
        }
        //Add check mark and update user defaults
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsVM.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none

        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsVM.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == settingsVM.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
}
