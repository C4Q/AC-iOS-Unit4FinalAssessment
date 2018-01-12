//
//  AnimationCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Masai Young on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    lazy var stepper: UIStepper = {
       let stpr = UIStepper()
        stpr.autorepeat = true
        stpr.wraps = true
        stpr.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        return stpr
    }()
    
    lazy var valueLabel:UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .white
        lbl.text = stepper.value.description
        lbl.font = UIFont(name: "EuphemiaUCAS-Bold", size: 20)
        lbl.layer.cornerRadius = 10.0
        lbl.clipsToBounds = true
        return lbl
    }()
    
    @objc func stepperValueChanged() {
        print(stepper.value)
        valueLabel.text = stepper.value.description
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        setupViews()
        self.backgroundColor = .orange
    }
    
    func setupViews() {
        setupNameLabel()
        setupStepper()
        setupValueLabel()
    }
    
    func setupNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupValueLabel() {
        self.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.rightAnchor.constraint(equalTo: stepper.leftAnchor, constant: -20).isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        
    }
    
    func setupStepper() {
        self.addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        stepper.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    

}
