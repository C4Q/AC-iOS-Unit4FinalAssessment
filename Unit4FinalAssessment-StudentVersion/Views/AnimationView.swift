//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    //image view
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "snowman")
        return iv
    }()
    
    
    //picker view
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = UIColor.red
        return pv
    }()
    
    
    //button
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"play"), for: .normal)
        return button
    }()
    
    
    //Initialization
    override init(frame: CGRect) {//overriding the parent class's functions
        super.init(frame: UIScreen.main.bounds)
        setUpGUI()
    }
    
    required init?(coder aDecoder: NSCoder) { //now the new initializer required for this uiView
        super.init(coder: aDecoder)
        //setUpGUI()
    }
    
    override func layoutSubviews() {
        // here you get the actual frame size of the elements before getting
        // laid out on screen
        super.layoutSubviews()
        // To add round edges
        //textField.layer.cornerRadius = textField.bounds.width / 1.0
        //textField.layer.masksToBounds = true
        
    }
    
    private func setUpGUI() {
        backgroundColor = .white
        setupAndConstrainObjects()
    }
    
    private func setupAndConstrainObjects() {
        
        //ARRAY MUST BE ON ORDER!!
        let animationViewObjects = [imageView, pickerView, actionButton] as [UIView]
        
        animationViewObjects.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            
            //image view
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.40),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.30),
            
            //picker view
            
            pickerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 150),
            pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20),
            pickerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0),
            
    
            //action button
            actionButton.topAnchor.constraint(equalTo: pickerView.topAnchor, constant: 20),
            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            actionButton.widthAnchor.constraint(equalTo: actionButton.heightAnchor),

            ])
    }
}
