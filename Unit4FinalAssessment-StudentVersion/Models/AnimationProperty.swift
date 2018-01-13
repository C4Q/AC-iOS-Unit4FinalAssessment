//
//  Animation.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

//enum PropertyName: String {
//    case widthMultiplier = "Width Multiplier"
//    case heightMutiplier = "Height Mutiplier"
//    case horizontalOffset = "Horizontal Offset"
//    case verticalOffset = "Vertical Offset"
//    case numberFlips = "Number of Flips"
//}

struct AnimationProperty: Codable {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    var startingStepperVal: Double
    var animation: String
    
    enum PropertyName: String, Codable {
        case widthMultiplier = "Width Multiplier"
        case heightMutiplier = "Height Mutiplier"
        case horizontalOffset = "Horizontal Offset"
        case verticalOffset = "Vertical Offset"
        case numberFlips = "Number of Flips"
    }
}
