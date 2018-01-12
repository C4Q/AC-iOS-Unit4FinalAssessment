//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Caroline Cruz on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Height Multiplier: 0.0"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper(frame:CGRect(x: 10, y: 150, width: 0, height: 0))
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.addTarget(self, action: #selector(SettingsViewController.stepperValueChanged(_:)), for: .valueChanged)
        return stepper
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: "SettingsCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        setupNameLabel()
        setupStepper()
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupStepper() {
        addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 80).isActive = true
        stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        stepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
