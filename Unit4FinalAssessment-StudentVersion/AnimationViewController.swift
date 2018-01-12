//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    lazy var snowmanImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "snowman")
        return image
    }()
    
    lazy var picker: UIPickerView = {
       let picker = UIPickerView()
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(snowmanImage)
        view.addSubview(picker)
        setUpImage()
        setUpPicker()
    }
    
    
    //Constraints
    
    func setUpImage() {
        snowmanImage.translatesAutoresizingMaskIntoConstraints = false
        snowmanImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        snowmanImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
    snowmanImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        snowmanImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        snowmanImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setUpPicker() {
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.topAnchor.constraint(equalTo: snowmanImage.bottomAnchor, constant: 8).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    
}
