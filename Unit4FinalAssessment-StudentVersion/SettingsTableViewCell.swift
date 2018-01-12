//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let step = UIStepper()
        step.maximumValue = 0.0
        step.minimumValue = 0.0
        step.stepValue = 0.0
        step.value = 0.0
        return step
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupNameLabel()
        setupStepper()
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [nameLabel.topAnchor.constraint(equalTo: topAnchor),
             nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
             nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             ])
    }
    
    private func setupStepper() {
        addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [stepper.topAnchor.constraint(equalTo: topAnchor),
             stepper.bottomAnchor.constraint(equalTo: bottomAnchor),
             stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    
}
