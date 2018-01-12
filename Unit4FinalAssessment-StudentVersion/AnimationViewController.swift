//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

// Because We're not repeating the same view in this assessment, It's ok to just put everything on the view controller. But if it gets too big just move the objects and contraints to a view.

// TODO: Setup Array for Animations

// TODO: Populate that array from File Manager in the view did appear OR with a custom delegate when the user hits save


class AnimationViewController: UIViewController {
    
    var buttonState = false
    let sampleArr = ["Thing1", "Thing2"]
    
    let animationView = AnimationsView()
    
    //To track button state and image state
    var startingPosition: CGRect = .zero
    override func viewDidAppear(_ animated: Bool) {
        startingPosition = animationView.snowmanImageView.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(animationView)
        animationView.pickerView.delegate = self
        animationView.pickerView.dataSource = self
        
        //setup play button
        buttonState = false
        animationView.playButton.addTarget(self, action: #selector(playAnimation), for: .touchUpInside)
        
        
    }
    
    //add button function
    @objc func playAnimation() {
        //check if you clicked before
        if buttonState == false {
            //you are hitting play
            if animationView.snowmanImageView.frame == startingPosition {
                //start animation since image has not moved and you hit play
                buttonState = true
                animationView.playButton.setImage(UIImage(named:"pause"), for: .normal)
                UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat,.autoreverse], animations: {
                    
                    self.animationView.snowmanImageView.layer.opacity = 0.0
                    self.animationView.snowmanImageView.transform = CGAffineTransform(translationX: self.view.bounds.maxX * 0.66, y: self.view.bounds.maxY).scaledBy(x: 0.001, y: 0.001)
                    
                })
                
            } else {
                //image has moved, so resume animation since you hit play
                buttonState = true
                animationView.playButton.setImage(UIImage(named:"pause"), for: .normal)
                resume(layer: animationView.snowmanImageView.layer)
            }
        } else {
            //you are hitting pause
            buttonState = false
            animationView.playButton.setImage(UIImage(named:"play"), for: .normal)
            pause(layer: animationView.snowmanImageView.layer)
        }

        
        
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

extension AnimationViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sampleArr.count
    }
    
    
}
extension AnimationViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedAnimation = sampleArr[row]
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sampleArr[row]
    }
    
    
}
