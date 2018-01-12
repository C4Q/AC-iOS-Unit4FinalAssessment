//
//  AnimationSettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationSettingsTableViewCell: UITableViewCell {
    
    //settings name label
    lazy var settingsNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.backgroundColor = .white
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.text = "BLAHHHHHHHHHHHHHHHHHHH"
        return label
    }()
    
    //segmented contro
    lazy var stepper: UIStepper = {
        var step = UIStepper()
        step.wraps = true
        step.autorepeat = true
        step.maximumValue = 100
        step.minimumValue = -100
        step.backgroundColor = .black
        step.tintColor = .yellow
        
        // Add target action method
        //customSC.addTarget(self, action: "changeColor:", forControlEvents: .ValueChanged)
        return step
    }()
    
    
    //Initialization
    //This is boiler plate for UIView
    // This overrides the default set-up of a tbv cell that noramlly has a textLabel and a detail Text label
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {//We aren't using a storyboard, so we need to tell the app what our screen size is. Storyboard does this for us automatically.
        super.init(style: style , reuseIdentifier: "AnimationCell")
        setUpGUI()
    }
    
    required init?(coder aDecoder: NSCoder) {//Since we are overriding the storyboard, we need to tell our app to initialize this instead as our superview.
        super.init(coder: aDecoder)
        setUpGUI()
    }
    
    //this gets called right
    override func layoutSubviews() {
        super.layoutSubviews()
        //you get the frame of the UI elements here
        stepper.layer.cornerRadius = 5.0  // Don't let background bleed
        stepper.layer.borderColor = UIColor.black.cgColor
        stepper.layer.masksToBounds = true
        setUpGUI()
    }
    
    private func setUpGUI() { //Each function in here represents the objects being created. By doing this, we can reuse the same code without typing over and over again.
        setupAndConstrainObjects()
    }
    
    private func setupAndConstrainObjects(){
        
        //ARRAY MUST BE ON ORDER!!
        let tbvViewObjects = [settingsNameLabel, stepper] as [UIView]
        
        tbvViewObjects.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            //settings name label
            settingsNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            settingsNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            settingsNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
            
            
            //segmented control
            stepper.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11),
            stepper.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            stepper.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30)
            ])
    }
    
    //MARK: - configure custom collection view cell
    //    public func configuretableViewCell(for forecast: SevenDayForecast){ //pass in forecast
    //        //setting properties for the custom collection view cell
    //
    //    }
}

