//
//  PropertyTVCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit


class PropertyTVCell: UITableViewCell, ButtonPressedDelegate {
    func buttonPressed(animation: String) {
        property.animation = animation
        FileManagerHelper.manager.addNew(newFavoriteImage: property)
    }
    

    var property: AnimationProperty! {
        didSet {
            self.animationPropertyLabel.text = property.name.rawValue + ": " + "\(property.startingStepperVal)"
            self.stepper.minimumValue = property.stepperMin
            self.stepper.maximumValue = property.stepperMax
            self.stepper.stepValue = property.stepperIncrement
            self.stepper.value = property.startingStepperVal
            setNeedsLayout()
            //PropertyTVCell.propertyToSend.append(property)
        }
    }
    
    //static var propertyToSend = [AnimationProperty]()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var animationPropertyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        //stepper.delegate = self
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: UIControlEvents.valueChanged)
        return stepper
    }()
    
    @objc func stepperValueChanged() {
        let startPosition = Int(property.startingStepperVal * 100)
        let newPosition = Int(Int(property.startingStepperVal * 100) - Int(stepper.value * 100))
        let val = (startPosition - newPosition)
        property.startingStepperVal = Double(val) / 100
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    private func commonInit() {
        addViewIntoSubview()
        displayOnScreen()
        constraints()
    }
    
    private func addViewIntoSubview() {
        addSubview(animationPropertyLabel)
        addSubview(stepper)
    }
    
    private func displayOnScreen() {
        animationPropertyLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constraints() {
        animationPropertyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animationPropertyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        stepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }

}
