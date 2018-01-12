//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //TO DO: Add more properties
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        navigationItem.title = "Settings"
        layoutTableView()
        setupNavBar()
    }
    
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: .done, target: self, action: #selector(newAnimationButtonPressed))
    }
    
    @objc func newAnimationButtonPressed() {
        let nameEntryModal = UIAlertController(title: "Add Setting", message: "Add name for animation", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in }
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            let textFieldText = nameEntryModal.textFields!.first!.text!
            guard let newAnimation = self.createAnimationFromInput(name: textFieldText) else { return }
            AnimationModel.manager.saveAnimation(newAnimation)
        }
        
        nameEntryModal.addTextField { (_ textField: UITextField) in }
        nameEntryModal.addAction(cancel)
        nameEntryModal.addAction(ok)
        
        present(nameEntryModal, animated: true, completion: nil)
    }
    
    func setupStepperValues(cell: SettingCell, indexPath: IndexPath) {
            switch (indexPath.section, indexPath.row) {
            case (0, _):
                cell.stepper.value = 1.0
                cell.stepper.stepValue = 0.1
                cell.stepper.maximumValue = 3.0
                cell.stepper.minimumValue = -3.0
                cell.valueLabel.text = cell.stepper.value.description
            case (1, _):
                cell.stepper.value = 0.0
                cell.stepper.stepValue = 10.0
                cell.stepper.minimumValue = -100.0
                cell.valueLabel.text = cell.stepper.value.description
            case (2, _):
                cell.stepper.value = 1.0
                cell.valueLabel.text = cell.stepper.value.description
            default:
                return
            }
    }
    
    private func createAnimationFromInput(name: String) -> AnimationParameters? {
        var savedValues: (w: Double, h: Double, hOff: Double, vOff: Double, flips: Double) = (0,0,0,0,0)
        for (index, cell) in tableView.visibleCells.enumerated() {
            let cell = cell as! SettingCell
            switch index {
            case 0:
                savedValues.w = cell.stepper.value
            case 1:
                savedValues.h = cell.stepper.value
            case 2:
                savedValues.hOff = cell.stepper.value
            case 3:
                savedValues.vOff = cell.stepper.value
            case 4:
                savedValues.flips = cell.stepper.value
            default:
                return nil
            }
        }
        
        let newAnimation = AnimationParameters(name: name, widthMultiplier: savedValues.w, heightMultiplier: savedValues.h, horizontalOffset: savedValues.hOff, verticalOffset: savedValues.vOff, numberOfFlips: savedValues.flips)
        
        dump(newAnimation)
        return newAnimation
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        //TO DO: Register your subclass
        tv.register(SettingCell.self, forCellReuseIdentifier: "AnimationCell")
        return tv
    }()
    
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return AnimationModel.manager.animationCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TO DO: Implement your Custom Cell that has a stepper
        let property = AnimationModel.manager.animationsOfType(indexPath.section)[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimationCell", for: indexPath) as! SettingCell
        
        cell.nameLabel.text = property.name.rawValue
        setupStepperValues(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AnimationModel.manager.numberOfAnimationsInSection(section)
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Size Settings"
        case 1:
            return "Location Settings"
        case 2:
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











