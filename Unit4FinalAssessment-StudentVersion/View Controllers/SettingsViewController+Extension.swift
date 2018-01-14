//
//  SettingsViewController+Extension.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

// MARK:- Table View Delegates
extension SettingsViewController: UITableViewDataSource, PropertyTVCellDelegate {
    func stepperValueChanged(_ sender: UITableViewCell, property: AnimationProperty) {
        guard let indexPath = tableView.indexPath(for: sender) else {return }
        
        properties[indexPath.section][indexPath.row].startingStepperVal = property.startingStepperVal
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let property = properties[indexPath.section][indexPath.row]
        let cell = PropertyTVCell(style: .default, reuseIdentifier: "PropertyCell") 
        cell.property = property
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
    
    func updateProperty(from property: AnimationProperty, section: Int, index: Int) {
        self.properties[section][index].startingStepperVal = property.startingStepperVal
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Size Settings"
        case 1:
            return "Position Settings"
        case 2:
            return "Other Settings"
        default:
            return "No found"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
