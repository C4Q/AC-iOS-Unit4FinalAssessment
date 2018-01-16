//
//  TableViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by Clint Mejia on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var labelDescription = ""
    
    //MARK: - outlets
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 1
        stepper.autorepeat = true
        stepper.isContinuous = true
        stepper.addTarget(self, action: #selector(stepperPressed), for: .valueChanged)
        return stepper
    }()
    
    //MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "tableViewCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //MARK: - Functions
    @objc private func stepperPressed() {
        label.text = "\(labelDescription): \(stepper.value.description)"
    }
    
    private func commonInit() {
        addSubview()
        setupViews()
        backgroundColor = .white
    }
    
    private func setupViews() {
        setupLabel()
        setupStepper()
    }
    
    private func addSubview() {
        contentView.addSubview(label)
        contentView.addSubview(stepper)
    }
    
    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupStepper() {
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        stepper.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
    
    public func configureCell(with setting: AnimationProperty) {
        label.text = setting.name.rawValue
        guard let text = label.text else { return }
        self.labelDescription = text
        stepper.maximumValue = setting.stepperMax
        stepper.minimumValue = setting.stepperMin
        stepper.stepValue = setting.stepperIncrement
        stepper.value = setting.startingStepperVal
    }
}

