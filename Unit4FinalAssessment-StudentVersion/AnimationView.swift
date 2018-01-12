//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupView()
    }

    lazy var snowmanImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.image = #imageLiteral(resourceName: "snowman")
        return imageView
    }()
    
    
    lazy var pickerView: UIPickerView = {
        let PV = UIPickerView()
        return PV
    }()
    
    lazy var animationButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "icons8-play-32"), for: .normal)
        return button
    }()
    
    func setupView(){
        setupImage()
        setupPicker()
        setupButton()
    }
    
    
    func setupImage(){
        addSubview(snowmanImage)
        let sf = safeAreaLayoutGuide
        snowmanImage.translatesAutoresizingMaskIntoConstraints = false
        snowmanImage.topAnchor.constraint(equalTo: sf.topAnchor, constant: 33).isActive = true
        snowmanImage.centerXAnchor.constraint(equalTo: sf.centerXAnchor).isActive = true
        snowmanImage.widthAnchor.constraint(equalTo: sf.widthAnchor, multiplier: 0.5).isActive = true
        snowmanImage.heightAnchor.constraint(equalTo: sf.heightAnchor, multiplier: 0.4).isActive = true
        
    }
    
    func setupPicker(){
        addSubview(pickerView)
        let sf = safeAreaLayoutGuide
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: snowmanImage.bottomAnchor, constant: 55).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: sf.centerXAnchor).isActive = true
        pickerView.widthAnchor.constraint(equalTo: sf.widthAnchor, multiplier: 0.7).isActive = true
        pickerView.heightAnchor.constraint(equalTo: sf.heightAnchor, multiplier: 0.2).isActive = true
        
    }

    func setupButton(){
        addSubview(animationButton)
        let sf = safeAreaLayoutGuide
        animationButton.translatesAutoresizingMaskIntoConstraints = false
        animationButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 22).isActive = true
        animationButton.centerXAnchor.constraint(equalTo: sf.centerXAnchor).isActive = true
    }
    
}


