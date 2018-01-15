//
//  TableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Lisa J on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        return stepper
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Placeholder"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // we get the frame of the UI elements here
//        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2.0
//        profileImageView.layer.masksToBounds = true
    }
    
    private func setupViews() {
        setupPicker()
        setupLabel()
    }
    
    func setupPicker() {
        addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
         stepper.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setupLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    
    
}
