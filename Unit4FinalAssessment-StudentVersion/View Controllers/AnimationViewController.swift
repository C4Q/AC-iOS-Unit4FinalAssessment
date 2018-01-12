//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit




enum SettingsKeys: String {
    case Width = "Width"
    case Height = "Height"
    case RotationX = "Rotation X"
    case RotationY = "Rotation Y"
    case RotationZ = "Rotation Z"
}



class AnimationViewController: UIViewController {
    
    var pauseOrPlay = "pause"
    var settingChosen = ""
    var settingArr = [String]()
    
    let animatedSettings = [SettingsKeys.Width.rawValue,
                            SettingsKeys.Height.rawValue,
                            SettingsKeys.RotationX.rawValue,
                            SettingsKeys.RotationY.rawValue,
                            SettingsKeys.RotationZ.rawValue
    ]
    var currentAnimation: String = ""

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
        button.setImage(#imageLiteral(resourceName: "playButton"), for: .normal)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonAction(sender: UIButton) {
        print("Button pushed")
        
        if settingChosen == "Default" {
            pause(layer: snowmanImage.layer)
        } else if settingChosen == "Big Flip" {
        animateRotationX()
        }
        
    }
    
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
        settingArr = ["Default", "Big Flip"]
    }
    
    
    

    
    
    
    func animateWidth() {
        
    }
    func animateHeight() {
        
    }
    
    func animateRotationX() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = 2.0 * .pi
        animation.fromValue = 0
        animation.byValue =  angleRadian
        animation.duration = 5.0
        animation.repeatCount = Float.infinity
        snowmanImage.layer.add(animation, forKey: nil)
    }
    
    func animateRotationY() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        let angleRadian = 2.0 * .pi
        animation.fromValue = 0
        animation.byValue =  angleRadian
        animation.duration = 5.0
        animation.repeatCount = Float.infinity
        snowmanImage.layer.add(animation, forKey: nil)
    }
    
    func animateRotationZ() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        let angleRadian = 2.0 * .pi
        animation.fromValue = 0
        animation.byValue =  angleRadian
        animation.duration = 5.0
        animation.repeatCount = Float.infinity
        snowmanImage.layer.add(animation, forKey: nil)
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
        picker.topAnchor.constraint(equalTo: snowmanImage.bottomAnchor, constant: 10).isActive = true
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
    
    
    
    
    func pause(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }
    
    func resume(layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
    
    
    
}

extension AnimationViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        settingChosen = settingArr[row]
        print(settingChosen)
    }
    
    
    
    
    
    
    
}

extension AnimationViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        return settingArr.count
    }
    
    
    
}



