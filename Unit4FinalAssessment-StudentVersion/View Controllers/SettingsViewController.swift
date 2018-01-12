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
    case numberOfXFlips = "Number of X Flips"
    // extra credit
    case numberOfYFlips = "Number of Y Flips"
    case numberOfZFlips = "Number of Z Flips"
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
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0), AnimationProperty(name: .heightMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)],
        [AnimationProperty(name: .horizontalOffset, stepperMin: -100.0, stepperMax: 100.0, stepperIncrement: 1.0, startingStepperVal: 0.0), AnimationProperty(name: .verticalOffset, stepperMin: -100.0, stepperMax: 100.0, stepperIncrement: 1.0, startingStepperVal: 0.0)],
        [AnimationProperty(name: .numberOfXFlips, stepperMin: 0, stepperMax: 5.0, stepperIncrement: 1.0, startingStepperVal: 0.0)]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        layoutTableView()
        configureAddAnimationButton()
    }
    
    private func configureAddAnimationButton() {
        let addAnimationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAnimationPressed))
        navigationItem.rightBarButtonItem = addAnimationButton
    }
    
    // https://stackoverflow.com/questions/37696485/show-the-textfield-in-the-alertcontroller-in-swift
    // reference for Alertview with input
    @objc private func addAnimationPressed() {
        let alertController = UIAlertController(title: "Add Setting", message: "Enter a name for your setting", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField) -> Void in
            textField.placeholder = "name here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            return
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            guard let textFields = alertController.textFields, let textInTexfield = textFields[0].text else { return }
            let animationToSave = SavedAnimation(animationName: textInTexfield)
            if FileManagerHelper.shared.isAnimationNameAlreadySaved(animation: animationToSave) {
                // show alert view that animation is already saved
                return
            }
            FileManagerHelper.shared.saveAnimation(with: animationToSave)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func layoutTableView() {
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
        tv.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingCell")
        return tv
    }()
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingsTableViewCell
        let property = properties[indexPath.section][indexPath.row]
        customCell.animationNameLabel.text = "\(property.name.rawValue): \(property.startingStepperVal)"
        customCell.animationStepper.value = property.startingStepperVal
        customCell.animationStepper.stepValue = property.stepperIncrement
        customCell.animationStepper.minimumValue = property.stepperMin
        customCell.animationStepper.maximumValue = property.stepperMax
        return customCell
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
        case 2:
            return "Flip Settings"
        default:
            return "Other Settings"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}











