//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    
    lazy var settingsLabel: UILabel =  {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    
    lazy var valueStepper: UIStepper = {
        let step = UIStepper()
        return step
    }()
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

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
    
    func setupViews(){
        setupLabel()
        setupStepper()
    }

    func setupLabel(){
        addSubview(settingsLabel)
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        settingsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
    
}
    func setupStepper(){
        addSubview(valueStepper)
        valueStepper.translatesAutoresizingMaskIntoConstraints = false
        valueStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        valueStepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        
        
        
    }
    
    
    
    
}
