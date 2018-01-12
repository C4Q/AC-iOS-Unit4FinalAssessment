//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Luis Calle on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    // animation name label
    lazy var animationNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func setupAnimationNameLabel() {
        addSubview(animationNameLabel)
        animationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            animationNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // animation stepper
    lazy var animationStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(stepperPressed), for: .valueChanged)
        return stepper
    }()
    
    @objc private func stepperPressed(sender: UIStepper) {
        guard let animationLabelText = animationNameLabel.text else { return }
        animationNameLabel.text = animationLabelText.components(separatedBy: ":")[0] + ": " + sender.value.description
    }
    
    private func setupAnimtationStepper() {
        addSubview(animationStepper)
        animationStepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            animationStepper.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FavoriteCell")
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
        setupAnimationNameLabel()
        setupAnimtationStepper()
    }

}
