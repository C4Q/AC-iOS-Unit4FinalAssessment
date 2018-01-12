//
//  SettingTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {


    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Setting Cell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .yellow
        setupViews()
    }
    
    private func setupViews() {
        setupConstraints()
        settingStepper.addTarget(self, action: #selector(progStepperSetValue), for: .valueChanged)
    }
    
    // SETTING NAME LABEL
    lazy var settingNameLabel: UILabel = {
       let label = UILabel()
        label.text = "name label"
        return label
    }()
    
    // STEPPER OBJECT
    lazy var settingStepper: UIStepper = {
       let stepper = UIStepper()
        

    
        return stepper
    }()
    
    // STEPPER VALUE LABEL
    lazy var stepperValueLabel: UILabel = {
       let label = UILabel()
        label.text = "0.0"
        /// TODO: CONNECT THE STEPPER FEEDBACK, LIMITS FROM PROPERTIES
        return label
    }()
    
    /// Credit: http://www.danieledonzelli.com/ios/uistepper-tutorial/
    @objc func progStepperSetValue(sender: UIStepper!) {
        let stepperValue = Double(sender.value)
        stepperValueLabel.text = String(stepperValue)
    }
    
    func configureCell(property: AnimationProperty) {
        settingStepper.minimumValue = property.stepperMin
        settingStepper.maximumValue = property.stepperMax
        settingStepper.stepValue = property.stepperIncrement
        
    }
    
    
    func setupConstraints() {
        // setting name object
        addSubview(settingNameLabel)
        settingNameLabel.translatesAutoresizingMaskIntoConstraints = false
        settingNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        settingNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        // stepper object
        addSubview(settingStepper)
        settingStepper.translatesAutoresizingMaskIntoConstraints = false
        settingStepper.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        settingStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        
        // stepper value label
        addSubview(stepperValueLabel)
        stepperValueLabel.translatesAutoresizingMaskIntoConstraints = false
        stepperValueLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        stepperValueLabel.trailingAnchor.constraint(equalTo: settingStepper.leadingAnchor, constant: -50).isActive = true
        
        
    }
    
    
}
