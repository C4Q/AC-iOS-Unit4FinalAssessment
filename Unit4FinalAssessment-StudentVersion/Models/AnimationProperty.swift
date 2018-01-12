//
//  AnimationProperty.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Clint Mejia on 1/11/18..
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct AnimationProperty: Codable {
    let row: Int
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}
