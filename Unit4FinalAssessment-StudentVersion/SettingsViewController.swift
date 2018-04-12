//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

// Looks like we're not using a view for this assessment.


enum PropertyName: String {
    
    case widthMultiplier = "Width Multiplier"
    case hightMultiplier = "Height Multiplier"
    case horizontalPosition = "Horizontal Position Offset"
    case verticalPosition = "Vertical Position Offset"
    case xAxisRotation = "X Axis Rotation Multiplier"
}

struct AnimationProperty {
    let name: PropertyName //Name
    let stepperMin: Double //Lowest number stepper can be
    let stepperMax: Double //Highest number stepper can be
    let stepperIncrement: Double //number that stepper increments by
    var startingStepperVal: Double //starting value of stepper
}

class SettingsViewController: UIViewController {

    //TO DO: Add more properties
    
    // TODO: The var properties is the name of the DEFAULT values for the animations. Therefore, saving a new set of animation values and giving it a name is the goal for this assessment.
    
    
    //This is a Matrix
    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 20.0, stepperIncrement: 0.2, startingStepperVal: 0.0)],
        [AnimationProperty(name: .hightMultiplier, stepperMin: 0, stepperMax: 20.0, stepperIncrement: 0.2, startingStepperVal: 0.0)],
        [AnimationProperty(name: .horizontalPosition, stepperMin: -500, stepperMax: 500.0, stepperIncrement: 20.0, startingStepperVal: 0.0)],
        [AnimationProperty(name: .verticalPosition, stepperMin: -500, stepperMax: 500.0, stepperIncrement: 20.0, startingStepperVal: 0.0)],
        [AnimationProperty(name: .xAxisRotation, stepperMin: 0.0, stepperMax: 10000.0, stepperIncrement: 1.0, startingStepperVal: 1.0)]
    ]
    
    var userProperties: [[AnimationProperty]] =
        [
            [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 20.0, stepperIncrement: 0.2, startingStepperVal: 0.0)],
            [AnimationProperty(name: .hightMultiplier, stepperMin: 0, stepperMax: 20.0, stepperIncrement: 0.2, startingStepperVal: 0.0)],
            [AnimationProperty(name: .horizontalPosition, stepperMin: -500, stepperMax: 500.0, stepperIncrement: 20.0, startingStepperVal: 0.0)],
            [AnimationProperty(name: .verticalPosition, stepperMin: -500, stepperMax: 500.0, stepperIncrement: 20.0, startingStepperVal: 0.0)],
            [AnimationProperty(name: .xAxisRotation, stepperMin: 0.0, stepperMax: 10000.0, stepperIncrement: 1.0, startingStepperVal: 1.0)]
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        layoutTableView()
        
    }
    
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.register(CustomTableViewCell.self, forCellReuseIdentifier: "SettingCell")
        return tv
    }()
    
    
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let property = userProperties[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! CustomTableViewCell
        
        cell.stepper.tag = indexPath.section
        
        cell.stepper.addTarget(self, action: #selector(stepperValueChanged(sender:)), for: .valueChanged)
        
        
        cell.label.text = property.name.rawValue + ": " +
            String(property.startingStepperVal)
        
        cell.stepper.maximumValue = property.stepperMax
        cell.stepper.minimumValue = property.stepperMin
        cell.stepper.stepValue = property.stepperIncrement
        cell.stepper.value = property.startingStepperVal
        
        return cell
        
    }
    
    @objc func stepperValueChanged(sender: UIStepper!){
        print("working?")
        print("Sender Value: \(sender.value) for Sender Tag \(sender.tag)")
        //The sender.tag is the corresponding section in userProperties
        
        // sender.tag 0 is width
        // sender.tag 1 is height
        // sender.tag 2 is horizontal
        // sender.tag 3 is vertical
        // sender.tag 4 is rotation
        
        switch sender.tag {
        case 0:
            userProperties[sender.tag][0].startingStepperVal = sender.value
        case 1:
            userProperties[sender.tag][0].startingStepperVal = sender.value
        case 2:
            userProperties[sender.tag][0].startingStepperVal = sender.value
        case 3:
            userProperties[sender.tag][0].startingStepperVal = sender.value
        case 4:
            userProperties[sender.tag][0].startingStepperVal = sender.value
        default:
            print("fail")
        }
        tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Width Settings"
        case 1:
            return "Height Settings"
        case 2:
            return "Horizontal Settings"
        case 3:
            return "Vertical Settings"
        case 4:
            return "Rotation Settings"
        //TO DO: Handle other sections
        default:
            return "Other Settings"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}












