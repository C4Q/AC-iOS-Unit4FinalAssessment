//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    let animationView = AnimationView()
    var animations = [DataPersistenceHelper.UserAnimation]() {
        didSet {
            animationView.pickerView.reloadAllComponents()
        }
    }
    
    var loadedAnimation: DataPersistenceHelper.UserAnimation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        
        view.addSubview(animationView)
        
        animationView.pickerView.dataSource = self
        animationView.pickerView.delegate = self
        
        
        animationView.controlButton.addTarget(self, action: #selector(controlButtonTapped), for: .touchUpInside)
        
        animationView.controlButton.isEnabled = false
        
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animations = DataPersistenceHelper.manager.getFavoriteAnimations()

    }
    
    @objc func controlButtonTapped() {
        if !animationView.controlButton.isSelected {
        animationView.controlButton.isSelected = true
        pauseLayer(layer: animationView.animationImageView.layer)
            
        } else {
            animationView.controlButton.isSelected = false
            resumeLayer(layer: animationView.animationImageView.layer)
        }
        
        
        

    }
    
    
    func runAnimation() {
        guard let loadedAnimation = loadedAnimation else { return }
        
        Animation.doAnimation(animation: loadedAnimation.animation, on: animationView.animationImageView)
        
        
    }
    
    /*
     How to pause and resume uiview animate
     https://stackoverflow.com/questions/33994520/how-to-pause-and-resume-uiview-animatewithduration
    */
    
    func pauseLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }
    
    func resumeLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
    
    
}

extension AnimationViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animations[row].name
        
    }
}

extension AnimationViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        animationView.controlButton.isEnabled = true
        loadedAnimation = animations[row]
        runAnimation()

    }

}

