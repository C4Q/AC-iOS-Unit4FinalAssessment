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
        
        stepper.minimumValue = 0.0
        stepper.maximumValue = 1.0
        stepper.stepValue = 0.1
        stepper.value = 0.0
    
        return stepper
    }()
    
    // STEPPER VALUE LABEL
    lazy var stepperValueLabel: UILabel = {
       let label = UILabel()
        label.text = "0.0"
        return label
    }()
    
    
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
        stepperValueLabel.leadingAnchor.constraint(equalTo: settingNameLabel.trailingAnchor, constant: 20).isActive = true
        
        
    }
    
    
}
