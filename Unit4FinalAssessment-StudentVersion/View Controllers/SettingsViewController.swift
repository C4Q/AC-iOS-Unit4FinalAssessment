//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

enum PropertyName: String {
    case widthMultiplier = "Width Multiplier"
    case heightMultiplier = "Height Multiplier"
    case horizontalOffset = "Horizontal Offset"
    case verticalOffset = "Vertical Offset"
    case numberOfFlips = "Number Of Flips"
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

struct CustomSetting: Codable {
    let widthMultiplier: Double
    let heightMultiplier: Double
    let horizontalOffset: Double
    let verticalOffset: Double
    let numberOfFlips: Double
}



class SettingsViewController: UIViewController {
    
    
    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0.0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)],
        [AnimationProperty(name: .heightMultiplier, stepperMin: 0.0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)],
        [AnimationProperty(name: .horizontalOffset, stepperMin: -100.0, stepperMax: 100.0, stepperIncrement: 20.0, startingStepperVal: 0.0)],
        [AnimationProperty(name: .verticalOffset, stepperMin: -100.0, stepperMax: 100.0, stepperIncrement: 20.0, startingStepperVal: 0.0)],
        [AnimationProperty(name: .numberOfFlips, stepperMin: 0.0, stepperMax: 10.0, stepperIncrement: 1.0, startingStepperVal: 0.0)]
        
    ]
    
    var currentSettings = CustomSetting(widthMultiplier: 0.0, heightMultiplier: 0, horizontalOffset: 0, verticalOffset: 0, numberOfFlips: 0) {
        didSet {
            print("current settings modified: \(currentSettings)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        layoutTableView()
        
        
        let saveBarItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveToFavorites))
        navigationItem.rightBarButtonItem = saveBarItem
        
    }
    
    @objc func saveToFavorites() {
        // save to favorites
//        guard let currentSetting = CustomSetting else { return }
//        let _ = FileManagerHelper.manager.addToSettings(name: "TEST", andSetting: customSetting)
        print("save button pressed")
        
        
        
    }
    
    
    // table view constrained to the entire Settings Tab View
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    // create the table view object
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.register(SettingTableViewCell.self, forCellReuseIdentifier: "Setting Cell")
        return tv
    }()
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ///TO DO: Implement your Custom Cell that has a stepper
        let property = properties[indexPath.section][indexPath.row]
        let cell = SettingTableViewCell()
        cell.settingNameLabel.text = property.name.rawValue
        cell.configureCell(property: property)
        /// current setting .name = value
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        /// TODO: FIX THE HEADERS
        
        switch section {
        case 0, 1:
            return "Size Settings"
        case 2, 3:
            return "Position Settings"
        default:
            return "Other Settings"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}




