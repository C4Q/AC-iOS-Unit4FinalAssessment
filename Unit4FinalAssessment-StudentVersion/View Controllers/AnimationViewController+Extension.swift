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
    
    
    func applyingAnimations() {
        highPosition.isActive = false
        widthPosition.isActive = false
        highPosition = animatedImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: CGFloat(property[1].startingStepperVal))
        widthPosition = animatedImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(property[0].startingStepperVal))
        self.centerX.constant = CGFloat(property[2].startingStepperVal)
        self.centerY.constant = CGFloat(property[3].startingStepperVal)
        propertyAnimator.addAnimations {
            self.view.layoutIfNeeded()
            self.flips()
            let angleRadian: CGFloat =  .pi * 2 //360
            self.animation.fromValue = 0.0 //degrees
            self.animation.byValue = angleRadian
            self.animation.duration = 3.0
            self.animation.repeatCount = .infinity
            self.animatedImageView.layer.add(self.animation, forKey: nil)
        }
        highPosition.isActive = true
        widthPosition.isActive = true
        propertyAnimator.startAnimation()
    }
    
    private func flips() {
        let flip = property[4].startingStepperVal
        switch flip {
        case 1:
            self.animation = CABasicAnimation(keyPath: "transform.rotation.x")
        case 2:
            self.animation = CABasicAnimation(keyPath: "transform.rotation.y")
        case 3:
            self.animation = CABasicAnimation(keyPath: "transform.rotation.z")
        default:
            self.animatedImageView.layer.removeAllAnimations()
        }
    }
    
    
}
