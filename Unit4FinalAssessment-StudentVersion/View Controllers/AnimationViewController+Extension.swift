//
//  AnimationViewController+Extension.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

//MARK:- Animation Functions
extension AnimationViewController {
    
    func animateRotationX() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian: CGFloat =  .pi * 2 //360
        //let rotation = CATransform3DMakeRotation(angleRadian, 1.0, 0.0, 0.0)
        //imageView.layer.transform = CATransform3D
        animation.fromValue = 0.0 //degrees
        animation.byValue = angleRadian
        animation.duration = 5.0 // seconds
        animation.repeatCount = .infinity
        animatedImageView.layer.add(animation, forKey: nil)
    }
    
    func animateRotationY() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        let angleRadian: CGFloat =  .pi * 2 //360
        //let rotation = CATransform3DMakeRotation(angleRadian, 1.0, 0.0, 0.0)
        //imageView.layer.transform = CATransform3D
        animation.fromValue = 0.0 //degrees
        animation.byValue = angleRadian
        animation.duration = 5.0 // seconds
        animation.repeatCount = .infinity
        animatedImageView.layer.add(animation, forKey: nil)
    }
    
    func animateRotationZ() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        let angleRadian: CGFloat =  .pi * 2 //360
        //let rotation = CATransform3DMakeRotation(angleRadian, 1.0, 0.0, 0.0)
        //imageView.layer.transform = CATransform3D
        animation.fromValue = 0.0 //degrees
        animation.byValue = angleRadian
        animation.duration = 5.0 // seconds
        animation.repeatCount = .infinity
        animatedImageView.layer.add(animation, forKey: nil)
    }
    
    
    
    func animateCornerRadius() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0
        animation.toValue = 20
        animation.duration = 1.0
        animatedImageView.layer.add(animation, forKey: nil)
        animatedImageView.layer.cornerRadius = 20
    }
    
    func animateScale(){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let toValue = CATransform3DMakeScale(0.5, 0.5, 0)
        let fromValue = CATransform3DMakeScale(1, 1, 0)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 2.0
        animation.repeatCount = 1
        animatedImageView.layer.add(animation, forKey: nil)
        //imageView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0)
    }
    
    func animateTranslation() {
        let toValue = CATransform3DMakeTranslation(-20,-20,0)
        let animation = CABasicAnimation(keyPath: "transform.translation")
        animation.toValue = toValue
        animation.duration = 1.0
        animatedImageView.layer.add(animation, forKey: nil)
    }
    
    
}
