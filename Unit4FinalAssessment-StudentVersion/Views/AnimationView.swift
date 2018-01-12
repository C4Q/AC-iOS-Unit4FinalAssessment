//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Reiaz Gafar on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    // Image view to animate
    lazy var animationImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .blue
        imageView.image = #imageLiteral(resourceName: "snowman")
        return imageView
    }()
    
    private func setupAnimationImageView() {
        addSubview(animationImageView)
        
        animationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = safeAreaLayoutGuide
                
        NSLayoutConstraint.activate([
            animationImageView.centerYAnchor.constraint(equalTo: safeArea.topAnchor, constant: UIScreen.main.bounds.height * 0.25),
            animationImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),

            animationImageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            animationImageView.heightAnchor.constraint(equalTo: animationImageView.widthAnchor)
            ])
        
    }
    
    // Play/Pause button
    lazy var controlButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    private func setupControlButton() {
        addSubview(controlButton)
        
        controlButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            controlButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            controlButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8),
            controlButton.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.05)
            
            
            
            ])
        
    }
    
    lazy var pickerView: UIPickerView = {
       let pickerView = UIPickerView()
        pickerView.backgroundColor = .purple
        return pickerView
    }()
    
    private func setupPickerView() {
        addSubview(pickerView)
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            //pickerView.topAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 0),
            pickerView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            pickerView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 1),
            pickerView.bottomAnchor.constraint(equalTo: controlButton.topAnchor, constant: -8)
            ])
        
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
        setupAnimationImageView()
        setupControlButton()
        setupPickerView()
    }
    
}


