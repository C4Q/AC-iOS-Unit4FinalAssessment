//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var pauseOrPlay = "pause"
    var settingArr = [String]()
    
    //Snowman Image View
    lazy var snowmanImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "snowman")
        return image
    }()
    
    //Picker View
    lazy var picker: UIPickerView = {
       let picker = UIPickerView()
        return picker
    }()
    
    //Play Pause Button
    lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "play"
        button.setImage(#imageLiteral(resourceName: "playButton"), for: .normal)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(snowmanImage)
        view.addSubview(picker)
        view.addSubview(playPauseButton)
        setUpImage()
        setUpButton()
        setUpPicker()
        self.picker.dataSource = self
        self.picker.delegate = self
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
        picker.bottomAnchor.constraint(equalTo: playPauseButton.topAnchor).isActive = true
        picker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
    }
    
    func setUpButton() {
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        playPauseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -175).isActive = true
        playPauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 175).isActive = true
        playPauseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
    
}

extension AnimationViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Default"
    }
    
}

extension AnimationViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
   
        
        return 2
            //settingArr.count
    }
    
    
    
}
