//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var currentAnimationSettings = Settings(width: 0, height: 0, horizontalPosition: 0, verticalPosition: 0, xRotations: 0, yRotations: 0, zRotations: 0)
    
    var properties: [[AnimationProperty]] = [
        [AnimationProperty(row: 0, name: .widthMultiplier, stepperMin: 0, stepperMax: 2.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
         AnimationProperty(row: 1, name: .heightMultiplier, stepperMin: 0, stepperMax: 2.0, stepperIncrement: 0.1, startingStepperVal: 0.0)],
        [AnimationProperty(row: 2, name: .horizontalOffset, stepperMin: -500.0, stepperMax: 500.0, stepperIncrement: 1.0, startingStepperVal: 0.0),
         AnimationProperty(row: 3, name: .veritcalOffset, stepperMin: -500.0, stepperMax: 500.0, stepperIncrement: 1.0, startingStepperVal: 0.0)],
        [AnimationProperty(row: 4, name: .numberOfXFlips, stepperMin: 0, stepperMax: 100.0, stepperIncrement: 1.0, startingStepperVal: 0.0),
         AnimationProperty(row: 5, name: .numberOfYFlips, stepperMin: 0, stepperMax: 100.0, stepperIncrement: 1.0, startingStepperVal: 0.0),
         AnimationProperty(row: 6, name: .numberOfZFlips, stepperMin: 0, stepperMax: 100.0, stepperIncrement: 1.0, startingStepperVal: 0.0)]
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationItem.title = "Settings"
        addSaveButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        addSaveButton()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
    }
    
    private func addSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(saveButtonPressed))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    //https://stackoverflow.com/a/37696533
    @objc func saveButtonPressed() {
        let alertController = UIAlertController(title: "Add Setting", message: "Enter a name for your setting", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { $0.textAlignment = .center })
        let cancelButtonPressed = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in }
        let okButtonPressed = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            guard let animationName = alertController.textFields?[0].text else { return }
//            let settings = self.gatherSettings()
            guard AnimationBrain.manager.checkForDuplicate(animation: animationName) == false else {
                self.showResultAlerController(with: "Oops!", message: "That animation already exists")
                return
            }
            print("yaas \(self.currentAnimationSettings)")
            AnimationBrain.manager.addNew(animation: self.currentAnimationSettings, named: animationName)
        }
        alertController.addAction(cancelButtonPressed)
        alertController.addAction(okButtonPressed)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //https://stackoverflow.com/questions/40055488/uialertcontroller-not-working-with-swift-3-0
    private func showResultAlerController(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
//    private func gatherSettings() -> Settings? {
//        var temp = Settings(width: 0, height: 0, horizontalPosition: 0, verticalPosition: 0, xRotations: 0, yRotations: 0, zRotations: 0)
//        for (index, cell) in tableView.visibleCells.enumerated() {
//            let cell = cell as! TableViewCell
//                            print(cell)
//            switch index {
//            case 0:
//                temp.width = cell.stepper.value
//            case 1:
//                temp.height = cell.stepper.value
//            case 2:
//                temp.horizontalPosition = cell.stepper.value
//                print(cell.stepper.value)
//            case 3:
//                temp.verticalPosition = cell.stepper.value
//            case 4:
//                temp.xRotations = Float(cell.stepper.value)
//            case 5:
//                temp.yRotations = Float(cell.stepper.value)
//            case 6:
//                temp.zRotations = Float(cell.stepper.value)
//                print(cell.stepper.value)
//            default:
//                return nil
//            }
//            return temp
//        }
//        return temp
//    }
    
    @objc func stepperPressed(_ stepper: UIStepper) {
        switch stepper.tag {
        case 0:
            currentAnimationSettings.width = stepper.value
        case 1:
            currentAnimationSettings.height = stepper.value
        case 2:
            currentAnimationSettings.horizontalPosition = stepper.value
        case 3:
            currentAnimationSettings.verticalPosition = stepper.value
        case 4:
            currentAnimationSettings.xRotations = Float(stepper.value)
        case 5:
            currentAnimationSettings.yRotations = Float(stepper.value)
        case 6:
            currentAnimationSettings.zRotations = Float(stepper.value)
        default:
            break
        }
    }
}


extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let property = properties[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.configureCell(with: property)
        cell.stepper.tag = property.row
        cell.stepper.addTarget(self, action: #selector(stepperPressed), for: .valueChanged)
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
        case 2:
            return "Other Settings"
        default:
            return "Misc"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}











