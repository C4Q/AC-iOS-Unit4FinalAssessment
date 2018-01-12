//
//  CustomTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
//    private let customReusableIdentifier = "customCell"
//    private let customCellNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
//
//
//        let stepper = UIStepper(frame: CGRect(x: 20, y: 100, width: 300, height: 20))
//        //.contentView.addSubview(stepper)
//////////////other
//    let settingName = UILabel()
//    let stepper = UIStepper()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        settingName.translatesAutoresizingMaskIntoConstraints = false
//        stepper.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(settingName)
//        contentView.addSubview(stepper)
    //}
///////////////
        //TODO:add constraints and activate
    // label
    lazy var settingNameLabel: UILabel = {
        let label = UILabel()
        label.text = "A setting name"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    //stepper
    lazy var settingsStepper: UIStepper = {
        let stepper = UIStepper()
        //configure my stepper settings
        return stepper
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SettingCell") //was fellow cell
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

    }
    
    private func setupViews() {
        setupStepper()
        setupSettingsNameLabel()
    }
    
    private func setupStepper() {
        addSubview(settingsStepper)
        settingsStepper.translatesAutoresizingMaskIntoConstraints = false
        settingsStepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.80).isActive = true
//        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
    }
    
    private func setupSettingsNameLabel() {
        addSubview(settingNameLabel)
        settingNameLabel.translatesAutoresizingMaskIntoConstraints = false
        settingNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
//    public func configureCell(fellow: Fellow) {
//        nameLabel.text = fellow.name
//    }

}
