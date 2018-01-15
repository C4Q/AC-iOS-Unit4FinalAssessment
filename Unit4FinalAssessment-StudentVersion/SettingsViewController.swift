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
    case numberOfFlips = "Number of Flips"
    case currentValue = "Current Value"
    //TO DO: Add other PropertyName Cases
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

class SettingsViewController: UIViewController {
    //TODO: init to send data?
    //TO DO: Add more properties
    var properties: [[AnimationProperty]] =
        [
            [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
             AnimationProperty(name: .heightMultiplier, stepperMin: 0, stepperMax:
                1.0, stepperIncrement: 0.1, startingStepperVal: 0.0
                ),
             AnimationProperty(name: .horizontalOffset, stepperMin: -100, stepperMax: 100, stepperIncrement: 10.0, startingStepperVal: 0.0),
             AnimationProperty(name: .verticalOffset, stepperMin: -100, stepperMax: 100, stepperIncrement: 10.0, startingStepperVal: 0.0),
             AnimationProperty(name: .numberOfFlips, stepperMin: 0, stepperMax: 10, stepperIncrement: 1.0, startingStepperVal: 0.0)]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        layoutTableView()
        configureNavBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    var savedSettingValues = SavedSetting(savedSettingName: "", width: 0.0, height: 0.0, horizontal: 0.0, vertical: 0.0, numberOfFlips: 0.0)
    
//    var savedSettingName = ""
//    var cell0 = 0.0
//    var cell1 = 0.0
//    var cell2 = 0.0
//    var cell3 = 0.0
//    var cell4 = 0.0
    
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.dataSource = self
        tv.delegate = self
        //TO DO: Register your subclass
        return tv
    }()
    
    @objc public func stepperValueChanged(_ sender:UIStepper!)
    {
        tableView.reloadData()
        print("UIStepper is now \(Int(sender.value))")
    }
    
    private func configureNavBar() {
        let saveSettingsBarItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveSettings))
        navigationItem.rightBarButtonItem = saveSettingsBarItem
    }
    
    @objc func saveSettings() {
//        savedSettingValues.append(cell0)
//        savedSettingValues.append(cell1)
//        savedSettingValues.append(cell2)
//        savedSettingValues.append(cell3)
//        savedSettingValues.append(cell4)
        
        let alert = UIAlertController(title: "Set setting title", message: "Set setting title here", preferredStyle: .alert)
        let action = UIAlertAction(title: "Setting Title Input", style: .default, handler: {(saveSettingTitle) in
            self.savedSettingValues.savedSettingName = (alert.textFields?.first?.text)!
            print(self.savedSettingValues.savedSettingName)
            let newSetting = self.savedSettingValues
            PersistentStoreManager.manager.addSavedSettingToList(savedSetting: newSetting)
            
            //saved stepper values
            print(self.savedSettingValues)
            
            
        })
        alert.addAction(action)
        //print(text)
        
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            //let settingTextField = textField
            textField.placeholder = "Input a title for your setting"
            
        })
        present(alert, animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TO DO: Implement your Custom Cell that has a stepper
        let property = properties[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let tag = indexPath.row
        cell.tag = tag
        cell.stepper.minimumValue = property.startingStepperVal
        cell.stepper.maximumValue = property.stepperMax
        cell.stepper.stepValue = property.stepperIncrement
        cell.label.text = "\(property.name.rawValue):\(cell.stepper.value)"
        cell.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        //setting picker values for saving later on
        switch cell.tag {
        case 0:
            savedSettingValues.width = cell.stepper.value
        case 1:
            savedSettingValues.height = cell.stepper.value
        case 2:
            savedSettingValues.horizontal = cell.stepper.value
        case 3:
            savedSettingValues.vertical = cell.stepper.value
        case 4:
            savedSettingValues.numberOfFlips = cell.stepper.value
        default:
            print("other cell")
        }
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
        //TO DO: Handle other sections
        case 1:
            return "Position Settings"
        default:
            return "Other Settings"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}











