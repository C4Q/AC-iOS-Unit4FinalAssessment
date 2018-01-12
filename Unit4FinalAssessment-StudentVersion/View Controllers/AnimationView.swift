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
//        pickerView.dataSource = self
//        pickerView.delegate = self
    }
    
    
    
    
    // UIImage object
    lazy var snowmanImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "snowman")
        return imageView
    }()
    
    // PickerView object
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
                
        return picker
        
    }()
    
    // Pause button object
    lazy var pauseButton: UIButton = {
        let button = UIButton()
        
        return button
        
    }()
    
    
    
    
    func setupConstraints() {
        // UIImage object constraints
        addSubview(snowmanImage)
        snowmanImage.translatesAutoresizingMaskIntoConstraints = false
        
        // PickerView Object constraints
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Pause Button Object constraints
        addSubview(pauseButton)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    

}
