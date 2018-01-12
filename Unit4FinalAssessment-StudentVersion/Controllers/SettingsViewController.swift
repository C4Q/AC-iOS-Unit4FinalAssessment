//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

protocol MySettingsDelegate {
    func newSettingAdded()
}

enum PropertyName: String {
    case widthMultiplier = "Width Multiplier"
    //TO DO: Add other PropertyName Cases...DONE
    case heightMultiplier = "Height Multiplier"
    case horizontalOffset = "horizontalOffset"
    case verticalOffset = "verticalOffset"
    case numberOfFlips = "numberOfFlips"
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}
class SettingsViewController: UIViewController {
    var delegate: MySettingsDelegate?

    //TO DO: Add more properties...DONE
    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0.0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
        AnimationProperty(name: .heightMultiplier, stepperMin: 0.0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)],
        [AnimationProperty(name: .horizontalOffset, stepperMin: -100, stepperMax: 100, stepperIncrement: 20.0, startingStepperVal: 0.0),
        AnimationProperty(name: .verticalOffset, stepperMin: -100, stepperMax: 100, stepperIncrement: 20.0, startingStepperVal: 0.0)],
        [AnimationProperty(name: .numberOfFlips, stepperMin: 0.0, stepperMax: 10, stepperIncrement: 1.0, startingStepperVal: 0.0)]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        //Add button created
        let addSettingButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewSettingButton))
        navigationItem.rightBarButtonItem = addSettingButtonItem
        layoutTableView()
    }
    
    @objc func addNewSettingButton() {
        delegate?.newSettingAdded()
        //TODO: add alert view controller with text field
        let alertController = UIAlertController(title: "Add Setting", message: "Enter a name for your setting", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            alert -> Void in
            let textField = alertController.textFields![0]
            self.delegate?.newSettingAdded()
            // do something with textField
            
            
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Search"
        })
        
        self.present(alertController, animated: true, completion: nil)
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
        //TO DO: Register your subclass
        //self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "SettingCell")
        return tv
    }()
}


extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TO DO: Implement your Custom Cell that has a stepper DO THIS
        let cell = UITableViewCell()
        //let cell = self.tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! CustomTableViewCell
        let property = properties[indexPath.section][indexPath.row]
        cell.textLabel?.text = property.name.rawValue
        
        
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











