//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    
    lazy var settingNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    lazy var settingStepper: UIStepper = {
        let stepp = UIStepper()
        stepp.tintColor = UIColor(red: 46/255, green: 184/255, blue: 230/255, alpha: 1.0)
        return stepp
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SettingsTableViewCell")
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
        let settingItems = [settingNameLabel, settingStepper] as [UIView]
        settingItems.forEach{ contentView.addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        setUpLabelConstraints()
        setUpStepperConstraints()
        
    }
    
    private func setUpLabelConstraints() {
        NSLayoutConstraint.activate([settingNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), settingNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                                     settingNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
                                     settingNameLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor)])
    }
    
    private func setUpStepperConstraints() {
        NSLayoutConstraint.activate([
            settingStepper.leadingAnchor.constraint(equalTo: settingNameLabel.trailingAnchor, constant: 50),
            settingStepper.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            settingStepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            settingStepper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)
            
            
            ])
    }
    
    public func configureCell(property: AnimationProperty) {
        settingNameLabel.text = property.name.rawValue
        settingStepper.maximumValue = property.stepperMax
        settingStepper.maximumValue = property.stepperMin
        settingStepper.stepValue = property.stepperIncrement
        settingStepper.value = property.startingStepperVal
    }
}
