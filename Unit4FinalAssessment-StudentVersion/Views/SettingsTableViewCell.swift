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
//        label.backgroundColor = .cyan
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
//    lazy var numLabel: UILabel = {
//        let label = UILabel(frame: CGRect.zero)//(x: 100, y: 100, width: 200, height: 200))
//        label.text = " 0.0"
//                label.backgroundColor = .cyan
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper(frame:CGRect(x: 10, y: 150, width: 0, height: 0))
        stepper.wraps = true
        
        // If tap and hold the button, UIStepper value will continuously increment
        stepper.autorepeat = true
        
        // Add a function handler to be called when UIStepper value changes
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
        //        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupNameLabel()
        setupStepper()
//        setupNumLabel()
        
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
//    private func setupNumLabel() {
//        addSubview(numLabel)
//        numLabel.translatesAutoresizingMaskIntoConstraints = false
//        numLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
//        numLabel.trailingAnchor.constraint(equalTo: stepper.leadingAnchor, constant: -50).isActive = true
//        numLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//    }
    
    private func setupStepper() {
        addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 80).isActive = true
        stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        stepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
