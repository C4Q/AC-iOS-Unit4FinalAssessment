//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

enum PropertyName: String, Codable {
    case widthMultiplier = "Width Multiplier"
    //TO DO: Add other PropertyName Cases
    case heightMultiplier = "Height Multiplier"
    case horizontalOffset = "Horizontal Offset"
    case verticalOffset = "Vertical Offset"
    case numberOfXFlips = "Number Of X Flips"
    case numberOfYFlips = "Number Of Y Flips"
    case numberOfZFlips = "Number Of Z Flips"
}

class AnimationProperty: Codable {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
    var currentVal: Double 
    
    init(name: PropertyName, stepperMin: Double, stepperMax: Double, stepperIncrement: Double, startingStepperVal: Double, currentVal: Double) {
        self.name = name
        self.stepperMin = stepperMin
        self.stepperMax = stepperMax
        self.stepperIncrement = stepperIncrement
        self.startingStepperVal = startingStepperVal
        self.currentVal = currentVal
    }
}

class SettingsViewController: UIViewController {

    //TO DO: Add more properties
    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.10000, startingStepperVal: 0.0, currentVal: 0.0),
         AnimationProperty(name: .heightMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.100000, startingStepperVal: 0.0, currentVal: 0.0)
         ],
        [AnimationProperty(name: .horizontalOffset, stepperMin: -500.0, stepperMax: 500.0, stepperIncrement: 20.00000, startingStepperVal: 0.0, currentVal: 0.0),
         AnimationProperty(name: .verticalOffset, stepperMin: -500.0, stepperMax: 500.0, stepperIncrement: 20.00000, startingStepperVal: 0.0, currentVal: 0.0)
         ],
        [AnimationProperty(name: .numberOfXFlips, stepperMin: 0, stepperMax: 10, stepperIncrement: 1.0000, startingStepperVal: 0.0, currentVal: 0.0),
         AnimationProperty(name: .numberOfYFlips, stepperMin: 0, stepperMax: 10, stepperIncrement: 1.0000, startingStepperVal: 0.0, currentVal: 0.0),
         AnimationProperty(name: .numberOfZFlips, stepperMin: 0, stepperMax: 10, stepperIncrement: 1.0000, startingStepperVal: 0.0, currentVal: 0.0)
         ]
    ]
    var settings = Setting.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.6, blue: 0.6, alpha: 1.0)
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        layoutTableView()
        //settings = StorageModel.manager.getSettings()
        tableView.reloadData()
        
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tryToSave))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    
    var actionToEnable: UIAlertAction?
    @objc func tryToSave() {
        let alert = UIAlertController(title: "Default Style", message: "Standard", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter Animation Name"
            textField.addTarget(self, action: #selector(self.nameTyped), for: .editingChanged)
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            let textfield = (alert.textFields?.first)!
            
            let name = textfield.text!
            let sizeSettings = SizeSettings(width: CGFloat(self.properties[0][0].currentVal), height: CGFloat(self.properties[0][1].currentVal))
            let positionSettings = PositionSettings(horizontalOffset: CGFloat(self.properties[1][0].currentVal), verticalOffset: CGFloat(self.properties[1][1].currentVal))
            let otherSettings = OtherSettings(numberOfXFlips: Int(self.properties[2][0].currentVal), numberOfYFlips: Int(self.properties[2][1].currentVal), numberOfZFlips: Int(self.properties[2][2].currentVal))
            
            let setting = Setting(name: name, sizeSettings: sizeSettings, positionSettings: positionSettings, otherSettings: otherSettings)
            
            StorageModel.manager.addToSettings(setting: setting)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        self.actionToEnable = saveAction
        saveAction.isEnabled = false
        self.present(alert, animated: true, completion: nil)
        
//        present(alert, animated: true, completion: nil)
    }
    
    @objc func nameTyped(_ sender: UITextField) {
        self.actionToEnable?.isEnabled  = !(sender.text!.isEmpty)
    }
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.layoutSubviews()
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.register(PropertyTableViewCell.self, forCellReuseIdentifier: "Property Cell")
        //TO DO: Register your subclass
        return tv
    }()
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TO DO: Implement your Custom Cell that has a stepper
        let property = properties[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Property Cell", for: indexPath) as! PropertyTableViewCell
        cell.configureCell(withProperty: property)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Size Settings"
        case 1:
            return "Position Settings"
        //TO DO: Handle other sections
        default:
            return "Other Settings"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}











