//
//  PropertyTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {
    
    var property: AnimationProperty!
    
    
    lazy var propertyName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        return stepper
    }()
    @objc func valueChanged(_ sender: UIStepper) {
        sender.value = Double(round(sender.value * 10)) / 10
        propertyName.text = "\(property.name.rawValue): \(stepper.value)"
        property.currentVal = sender.value
    }
    
    private func commonInit() {
        setupViews()
    }
    override func layoutSubviews() {
        commonInit()
    }
    private func setupViews() {
        setupPropertyName()
        setupStepper()
    }
    
    private func setupPropertyName() {
        addSubview(propertyName)
        propertyName.translatesAutoresizingMaskIntoConstraints = false
        [propertyName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
         propertyName.centerYAnchor.constraint(equalTo: centerYAnchor)].forEach{$0.isActive = true}
    }
    
    private func setupStepper() {
        addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        [stepper.centerYAnchor.constraint(equalTo: centerYAnchor),
         stepper.widthAnchor.constraint(equalToConstant: 50),
         stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -stepper.bounds.width)].forEach{$0.isActive = true}
    }
    
    public func configureCell(withProperty property: AnimationProperty) {
        self.property = property
        stepper.minimumValue = property.stepperMin
        stepper.maximumValue = property.stepperMax
        stepper.stepValue = property.stepperIncrement
        stepper.value = property.startingStepperVal
        propertyName.text = "\(property.name.rawValue): \(stepper.value)"
    }
}
