//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {

    // setup custom view
    
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
        setupConstraints()
    }
    
    
    
    
    // UIImage object
    lazy var snowmanImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "snowman")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // PickerView object
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .green
        return picker
    }()
    
    // Pause button object
    lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.setTitle("▶️", for: .normal)
        button.addTarget(self, action: #selector(pauseButtonPressed), for: .touchUpInside)
        button.backgroundColor = .white
//        button.backgroundImage(for: )
        return button
        
    }()
    
    @objc func pauseButtonPressed() {
        // pause animation
        print("pause button pressed")
        
    }
    
    
    func setupConstraints() {
        // UIImage object constraints
        addSubview(snowmanImage)
        snowmanImage.translatesAutoresizingMaskIntoConstraints = false
        snowmanImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        snowmanImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        snowmanImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        snowmanImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        // PickerView Object constraints
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        pickerView.topAnchor.constraint(equalTo: snowmanImage.bottomAnchor, constant: 10).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        // Pause Button Object constraints
        addSubview(pauseButton)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        pauseButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 10).isActive = true
        
        
    }
    
    

}
