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
    var currentPickerViewRow: Int = 0
    
    //To track button state and image state
    var startingPosition: CGRect = .zero {
        didSet {
            self.widthValue = startingPosition.width
            self.xOffSet = startingPosition.minX
            self.yOffSet = startingPosition.minY
            self.heightValue = startingPosition.height
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startingPosition = animationView.snowmanImageView.frame
    }
    
    //To track animation values to change
    var widthValue: CGFloat = 0
    var heightValue: CGFloat  = 0
    var xOffSet: CGFloat = 0
    var yOffSet: CGFloat = 0
    var numberOfRotations: Int = 1 // TODO: Set to 0 for data testing
    
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
                    
                    //Eventually, there will need to be a switch of some kind that dynamically changes this block of code based on the pickerview selected row.
                    var selectedAnimationsToRun = self.sampleArr[self.currentPickerViewRow] //In theory, this should populate and then replace the number values in the animations
                    
//                    var widthValue = 0
//                    var heightValue = 0
//                    var xOffSet = 0
//                    var yOffSet = 0
//                    var numberOfRotations = 1
                    
                    self.animationView.snowmanImageView.layer.opacity = 0.0
                    
                    //To change x and y position
                    self.animationView.snowmanImageView.transform = CGAffineTransform(translationX: self.xOffSet, y: self.yOffSet)
                    
                    //To change height
                    
                    //To change width
                    
                    //To set number of rotations on X Axis
                    
                    
                    
                    
                    
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
