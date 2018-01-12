//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Luis Calle on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    // snowman image view
    lazy var snowmanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "snowman")
        return imageView
    }()
    
    private func setupSnowmanImageView() {
        addSubview(snowmanImageView)
        snowmanImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            snowmanImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            snowmanImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            snowmanImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            snowmanImageView.heightAnchor.constraint(equalTo: snowmanImageView.widthAnchor)
        ])
    }
    
    // saved settings picker view
    lazy var savedSettingsPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    private func setupSavedSettingsPickerView() {
        addSubview(savedSettingsPickerView)
        savedSettingsPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            savedSettingsPickerView.topAnchor.constraint(equalTo: snowmanImageView.bottomAnchor, constant: 8),
            savedSettingsPickerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            savedSettingsPickerView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    // animation button
    lazy var animationbutton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        return button
    }()
    
    private func setupAnimationbutton() {
        addSubview(animationbutton)
        animationbutton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationbutton.topAnchor.constraint(equalTo: savedSettingsPickerView.bottomAnchor, constant: 8),
            animationbutton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.1),
            animationbutton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            animationbutton.heightAnchor.constraint(equalTo: animationbutton.widthAnchor),
            animationbutton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
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
        backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        setupViews()
    }
    
    private func setupViews() {
        setupSnowmanImageView()
        setupSavedSettingsPickerView()
        setupAnimationbutton()
    }

}
