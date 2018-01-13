//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    //00bfff - Light Blue
    //2eb8e6 - Medium Blue
    //2200ff - Dark Blue
    
    
    lazy var snowmanImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "snowman")
        return iv
    }()
    
    lazy var savedSettingsPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.setValue(UIColor(red: 46/255, green: 184/255, blue: 230/255, alpha: 1.0), forKeyPath: "textColor")
        return picker
    }()
    
    lazy var animateButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = #imageLiteral(resourceName: "playButton")
        button.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        //        button.tintColor = UIColor(red: 46/255, green: 184/255, blue: 230/255, alpha: 1.0)
        button.backgroundColor = UIColor(red: 46/255, green: 184/255, blue: 230/255, alpha: 1.0)
        return button
    }()
    
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
        let snowManItems = [snowmanImageView, savedSettingsPicker, animateButton] as [UIView]
        snowManItems.forEach{ addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        setImageViewConstraints()
        setPickerConstraints()
        setButtonConstraints()
    }
    
    
    private func  setImageViewConstraints() {
        NSLayoutConstraint.activate([
            snowmanImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            snowmanImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -120),
            snowmanImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            snowmanImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)
            ])
        
    }
    
    private func setPickerConstraints() {
        NSLayoutConstraint.activate([
            savedSettingsPicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            savedSettingsPicker.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 100),
            savedSettingsPicker.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            savedSettingsPicker.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
            ])
    }
    
    private func setButtonConstraints() {
        NSLayoutConstraint.activate([
            animateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            animateButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
            //            animateButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.1),
            //            animateButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
            //
            ])
    }
    
    
    
}

