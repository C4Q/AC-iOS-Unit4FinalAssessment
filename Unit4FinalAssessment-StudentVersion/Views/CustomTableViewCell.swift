//
//  CustomTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = " Title "
        //…
        label.translatesAutoresizingMaskIntoConstraints = false //Must use
        return label
    }()
    
        //stepper
        lazy var settingsStepper: UIStepper = {
            let stepper = UIStepper()
            //configure my stepper settings
            return stepper
        }()
    
    //MARK: init
    //Add Subviews and then layout Contraints to the Cell’s contentView
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "settingCell")
        addSubViewsAndlayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /// Add and sets up subviews with programmically added constraints
    func addSubViewsAndlayout() {
        contentView.addSubview(titleLabel) //will crash if not added
        
        let screenwidth = UIScreen.main.bounds.width //get any other properties you need
        
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24).isActive = true
        
        contentView.addSubview(settingsStepper)
        
        settingsStepper.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        settingsStepper.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 5).isActive = true
        settingsStepper.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5).isActive = true
    }
//    // label
//    lazy var settingNameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "A setting name"
//        label.textAlignment = .left
//        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
//        return label
//    }()
//
//    //stepper
//    lazy var settingsStepper: UIStepper = {
//        let stepper = UIStepper()
//        //configure my stepper settings
//        return stepper
//    }()
//
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: "SettingCell")
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
//
//    private func commonInit() {
//        backgroundColor = .white
//        setupViews()
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        // we get the frame of the UI elements here
//
//    }
//
//    private func setupViews() {
//        setupStepper()
//        setupSettingsNameLabel()
//    }
//
//    private func setupStepper() {
//        addSubview(settingsStepper)
//        settingsStepper.translatesAutoresizingMaskIntoConstraints = false
//        settingsStepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
////        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
////        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.80).isActive = true
////        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
//    }
//
//    private func setupSettingsNameLabel() {
//        addSubview(settingNameLabel)
//        settingNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        settingNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//    }
//
//    public func configureCell(fellow: Fellow) {
//        nameLabel.text = fellow.name
//    }

}
