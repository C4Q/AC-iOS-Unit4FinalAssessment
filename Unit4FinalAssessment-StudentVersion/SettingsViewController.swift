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
    case horizontalOffset = "Horizontal OffSet"
    case verticalOffset = "Vertical OffSet"
    case xAxisFlip = "xAxisFlip"
    case yAxisFlip = "yAxisFlip"
    case zAxisFlip = "zAxisFlip"
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

class SettingsViewController: UIViewController {

    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
         AnimationProperty(name: .heightMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)
         ],
        [AnimationProperty(name: .horizontalOffset, stepperMin: -100, stepperMax: 100, stepperIncrement: 20, startingStepperVal: 0),
         AnimationProperty(name: .verticalOffset, stepperMin: -100, stepperMax: 100, stepperIncrement: 20, startingStepperVal: 0)
        ],
        [
            AnimationProperty(name: .xAxisFlip, stepperMin: 0, stepperMax: 10, stepperIncrement: 1, startingStepperVal: 0),
            AnimationProperty(name: .yAxisFlip, stepperMin: 0, stepperMax: 10, stepperIncrement: 1, startingStepperVal: 0),
            AnimationProperty(name: .zAxisFlip, stepperMin: 0, stepperMax: 10, stepperIncrement: 1, startingStepperVal: 0)
        ]
    ]

    var values: [[Double]] =
        [
            [0,
             0],
            [0,
             0
            ],
            [
                0,
                0,
                0
            ]
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        layoutTableView()
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc func add(){

        
        let alert = UIAlertController(title: "Save Settings", message: "Enter a name for your settings", preferredStyle: .alert)
            alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            let savedPage = SavedSettings.init(name: (textField?.text)!, widthMultiplier: self.values[0][0], heightMultiplier: self.values[0][1], horizontalOffset: self.values[1][0], verticalOffset: self.values[1][1], xAxisFlip: self.values[2][0], yAxisFlip: self.values[2][1], zAxisFlip: self.values[2][2])
            
            let _ = PersistentStoreManager.manager.addToFavorites(savedSettings: savedPage)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        
                self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    @objc func update(){
       
        self.tableView.reloadData()
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
        tv.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        cell.settingsLabel.text = property.name.rawValue + " \(cell.valueStepper.value)"
        cell.valueStepper.addTarget(self, action: #selector(update), for: .valueChanged)

        cell.valueStepper.minimumValue = property.stepperMin
        cell.valueStepper.maximumValue = property.stepperMax
        cell.valueStepper.stepValue = property.stepperIncrement
        values[indexPath.section][indexPath.row] = cell.valueStepper.value
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
        default:
            return "Other Settings"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}













