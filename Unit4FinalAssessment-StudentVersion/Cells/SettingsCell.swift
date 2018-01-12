//
//  SettingsCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Ashlee Krammer on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    lazy var settingLabel: UILabel = {
       let label = UILabel()
        label.text = "A Setting You will Impliment Here"
        label.backgroundColor = .yellow
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        return stepper
    }()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) { // Required : Storyboard
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func commonInit() {
        setUpStepper()
        setUpSettingLabel()
    }
    
    func setUpStepper() {
        let sf = safeAreaLayoutGuide
        addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
//        stepper.topAnchor.constraint(equalTo: sf.topAnchor, constant: 3).isActive = true
//        stepper.bottomAnchor.constraint(equalTo: sf.bottomAnchor, constant: 3).isActive = true
        stepper.trailingAnchor.constraint(equalTo: sf.trailingAnchor, constant: -8).isActive = true
        stepper.centerXAnchor.constraint(equalTo: sf.centerXAnchor).isActive = true
        
    }
    
    func setUpSettingLabel() {
        let sf = safeAreaLayoutGuide
        addSubview(settingLabel)
        settingLabel.translatesAutoresizingMaskIntoConstraints = false
        settingLabel.trailingAnchor.constraint(equalTo: stepper.leadingAnchor, constant: -8).isActive = true
        settingLabel.leadingAnchor.constraint(equalTo: sf.leadingAnchor, constant: 8).isActive = true
        settingLabel.centerXAnchor.constraint(equalTo: sf.centerXAnchor).isActive = true

    }
    
    
}

