//
//  AnimationModel.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class Animations {
    
    var av = AnimationView()
    
    func animateHorizontal() {
        let animation = CABasicAnimation(keyPath: "translation.x") //string must be the same as the property we want to animate
        animation.fromValue = 1.0
        animation.toValue = 10.0
        animation.duration = 0.5
    }
    
    func animateVertical() {
        let animation = CABasicAnimation(keyPath: "translation.y") //string must be the same as the property we want to animate
        animation.fromValue = 1.0
        animation.toValue = 10.0
        animation.duration = 0.5
    }
    
    func animateWidth() {
        let animation = CABasicAnimation(keyPath: "scale.x") //string must be the same as the property we want to animate
        animation.fromValue = 1.0
        animation.toValue = 10.0
        animation.duration = 0.5
    }
    
    func animateHeight() {
        let animation = CABasicAnimation(keyPath: "scale.y") //string must be the same as the property we want to animate
        animation.fromValue = 1.0
        animation.toValue = 10.0
        animation.duration = 0.5
    }
    
    func animateRotationX() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.x") //string must be the same as the property we want to animate
        let angleRadian = CGFloat(2.0 * .pi)
        animation.fromValue = 0 //degrees
        animation.byValue = angleRadian
        animation.duration = 0.5 //seconds
        animation.repeatCount = Float.infinity
        av.imageView.layer.add(animation, forKey: nil)
    }
    
    func animateRotationY() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y") //string must be the same as the property we want to animate
        let angleRadian = CGFloat(2.0 * .pi)
        animation.fromValue = 0 //degrees
        animation.byValue = angleRadian
        animation.duration = 2.0 //seconds
        animation.repeatCount = Float.infinity
        av.imageView.layer.add(animation, forKey: nil)
    }
    
    func animateRotationZ() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z") //string must be the same as the property we want to animate
        let angleRadian = CGFloat(2.0 * .pi)
        animation.fromValue = 0 //degrees
        animation.byValue = angleRadian
        animation.duration = 0.01 //seconds
        animation.repeatCount = Float.infinity
        av.imageView.layer.add(animation, forKey: nil)
    }
    
    func numberOfFlips(animation: CABasicAnimation) {
        animation.repeatCount = 0.0
    }
    
}
