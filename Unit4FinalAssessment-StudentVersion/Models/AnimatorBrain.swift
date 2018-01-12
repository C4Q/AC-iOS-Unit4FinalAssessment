//
//  AnimatorBrain.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Reiaz Gafar on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimatorBrain {
    
    private init() {}
    static let manager = AnimatorBrain()
    
    var animations = [String : Animation]()
    
    func addAnimation(name: String, animation: Animation) {
        animations[name] = animation
    }
    
    
}
