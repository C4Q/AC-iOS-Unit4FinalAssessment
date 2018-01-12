//
//  View.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class CustomView: UIView {
   
    lazy var snowmanImage: UIImageView = {
        let snowmanImage = UIImageView()
        snowmanImage.contentMode = .scaleAspectFill
        snowmanImage.backgroundColor = .gray
        snowmanImage.image = #imageLiteral(resourceName: "snowman")
        return snowmanImage
    }()
    
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    lazy var button: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.9, alpha: 1.0)
    button.setTitle("Pause/Play", for: .normal)
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds )
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        backgroundColor = UIColor(red: 0.0, green: 0.6, blue: 0.9, alpha: 1.0)
        setupViews()
        
    }
    private func setupViews() {
       setupSnowmanImage()
       setupPickerView()
       setupbutton()
    }

    private func setupPickerView() {
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        pickerView.topAnchor.constraint(equalTo: snowmanImage.bottomAnchor, constant: 50).isActive = true
    }
    
    private func setupSnowmanImage() {
        addSubview(snowmanImage)
        snowmanImage.translatesAutoresizingMaskIntoConstraints = false
        snowmanImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18).isActive = true
        snowmanImage.widthAnchor.constraint(equalTo: snowmanImage.heightAnchor).isActive = true
        snowmanImage.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        snowmanImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        snowmanImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
    }
    
    private func setupbutton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90).isActive = true
        button.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 50).isActive = true 
    }
}

