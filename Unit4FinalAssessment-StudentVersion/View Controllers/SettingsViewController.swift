//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0.0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0, animation: ""),
         AnimationProperty(name: .heightMutiplier, stepperMin: 0.0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0, animation: "")],
        [AnimationProperty(name: .horizontalOffset, stepperMin: -100, stepperMax: 100, stepperIncrement: 10, startingStepperVal: 0, animation: ""),
        AnimationProperty(name: .verticalOffset, stepperMin: -100, stepperMax: 100, stepperIncrement: 10, startingStepperVal: 0, animation: "")],
        [AnimationProperty(name: .numberFlips, stepperMin: 0, stepperMax: 10.0, stepperIncrement: 1.0, startingStepperVal: 0.0, animation: "")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(saveAnimation))
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
        tv.register(PropertyTVCell.self, forCellReuseIdentifier: "PropertyCell")
        return tv
    }()
}

// MARK:- Functions
extension SettingsViewController {
    
    @objc func saveAnimation() {
        let alert = UIAlertController(title: "Add Setting", message: "Enter a name for your setting", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Setting name"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if let textField = alert?.textFields {
                if let settingName = textField[0].text {
                    print("Text field: \(settingName)")
                    print(self.properties)
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}











