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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(animationView)
        
        animationView.pickerView.dataSource = self
        animationView.pickerView.delegate = self
        navigationItem.title = "Animation"
    }
    
    
    func defaultLayerValues() {
        let width = animationView.snowmanImage.layer.contentsRect.width
        
    }
    
    
}

extension AnimationViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
//        return savedSettings.count
    }
    
    
    
}


extension AnimationViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // return Settings.settingName[row]
        return "Sample Setting"
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // return Settings.categorySet = Settings.settingName[row]
    }
}


// MARK: Animation Functions - usig core animation
extension AnimationViewController {
    
    func animateWidthMultiplier() {

    }
    
    func animateHeightMultiplier() {
        
    }
    

    
    
    func animateImage() {
        // WIDTH MULTIPLIER
        let widthMultiplierAnimation = CABasicAnimation(keyPath: "transform.scale.x")
//        widthMultiplierAnimation.toValue = \(value of this stepper)
        
        
        // HEIGHT MULTIPLIER
        let heightMultiplierAnimation = CABasicAnimation(keyPath: "transform.scale.y")
//        heightMultiplierAnimation.toValue = \(value of this stepper)
        
        
        // HORIZONTAL OFFSET
        let horizontalOffsetAnimation = CABasicAnimation(keyPath: "transform")
        horizontalOffsetAnimation.toValue = CATransform3DMakeTranslation(-100, 0, 0)
//        animationView.snowmanImage.layer.add(horizontalOffsetAnimation, forKey: nil)
        
        
        // VERTICAL OFFSET
        let verticalOffsetAnimation = CABasicAnimation(keyPath: "transform")
        verticalOffsetAnimation.toValue = CATransform3DMakeTranslation(0, -100, 0)
//        animationView.snowmanImage.layer.add(verticalOffsetAnimation, forKey: nil)
        
        
        // NUMBER OF FLIPS
        let xAxisAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = CGFloat(2.0 * .pi) // 360
        xAxisAnimation.fromValue = 0 // degrees
        xAxisAnimation.byValue = angleRadian
        xAxisAnimation.repeatCount = Float.infinity
//        animationView.snowmanImage.layer.add(xAxisAnimation, forKey: nil)
        
        
        /// list all of the animations above in this one function and group them here in the array.
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [widthMultiplierAnimation, heightMultiplierAnimation, verticalOffsetAnimation, horizontalOffsetAnimation, xAxisAnimation]
        groupAnimation.duration = 1.0
        animationView.snowmanImage.layer.add(groupAnimation, forKey: nil)
        
        
    }


    
    
}
