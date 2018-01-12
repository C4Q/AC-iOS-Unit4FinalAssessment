//
//  CustomTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Richard Crichlow on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //label
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "Welcome"
        return label
    }()
    
    //stepper
    lazy var stepper: UIStepper = {
        let sp = UIStepper()
        sp.wraps = true
        sp.autorepeat = true
        return sp
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: "SettingCell")
        setUpGUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpGUI()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpGUI()
    }
    
    private func setUpGUI() {
        setupAndConstrainObjects()
    }
    
    private func setupAndConstrainObjects(){
        
        let tableViewCellObjects = [label, stepper] as [UIView]
        
        tableViewCellObjects.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        
        contentView.addSubview(label)
        contentView.addSubview(stepper)
        
        NSLayoutConstraint.activate([
            //label
        
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            //stepper
            stepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stepper.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
            ])
    }
    
    
    
    
}
