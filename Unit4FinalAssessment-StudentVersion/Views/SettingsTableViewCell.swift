//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Reiaz Gafar on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    lazy var propertyLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func setupPropertyLabel() {
        addSubview(propertyLabel)
        
        propertyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            propertyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            propertyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
            
            
            ]
        )
        
        
    }
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func setupValueLabel() {
        addSubview(valueLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            valueLabel.leadingAnchor.constraint(equalTo: propertyLabel.trailingAnchor, constant: 8),
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        
        
        
    }
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(stepperTapped), for: .valueChanged)
        var section = 0
        var row = 0
        return stepper
    }()
    
    @objc func stepperTapped() {
        valueLabel.text = stepper.value.description
    }
    
    private func setupStepper() {
        addSubview(stepper)
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stepper.centerYAnchor.constraint(equalTo: centerYAnchor),
            stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
            
            
            ])
        
        
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupPropertyLabel()
        setupValueLabel()
        setupStepper()
    }
    
}
