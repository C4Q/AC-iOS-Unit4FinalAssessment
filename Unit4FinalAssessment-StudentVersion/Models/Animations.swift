//
//  Animations.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Masai Young on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

struct AnimationParameters: Codable {
    let name: String
    let widthMultiplier: Double
    let heightMultiplier: Double
    let horizontalOffset: Double
    let verticalOffset: Double
    let numberOfFlips: Double
}

enum PropertyName: String {
    case widthMultiplier = "Width Multiplier"
    case heightMultiplier = "Height Multiplier"
    case horizontalOffset = "Horizontal Offset"
    case verticalOffset = "Vertical Offset"
    case numberOfFlips = "Number of Flips"
    //TO DO: Add other PropertyName Cases
}

enum AnimationCategory {
    case size([AnimationProperty])
    case location([AnimationProperty])
    case rotation([AnimationProperty])
}


private let widthAnimation = AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)
private let heightAnimation = AnimationProperty(name: .heightMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)
private let horizontalOffsetAnimation = AnimationProperty(name: .horizontalOffset, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)
private let verticalOffsetAnimation = AnimationProperty(name: .verticalOffset, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)
private let rotationAnimation = AnimationProperty(name: .numberOfFlips, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)

let sizeAnimations = AnimationCategory.size([widthAnimation, heightAnimation])
let locationAnimations = AnimationCategory.location([horizontalOffsetAnimation, verticalOffsetAnimation])
let roationAnimations = AnimationCategory.rotation([rotationAnimation])


class AnimationModel {
    private init() {}
    static let manager = AnimationModel()
    
    let animationCategories = [sizeAnimations, locationAnimations, roationAnimations]
    
    var savedAnimations = KeyedArchiverClient.shared.fetchAnimations() {
        didSet {
            KeyedArchiverClient.shared.setFavorites(listOfAnimations: savedAnimations)
        }
    }
    

    func numberOfAnimationsInSection(_ sectionNumber: Int) -> Int {
        let selectedAnimations = animationCategories[sectionNumber]
            switch selectedAnimations {
            case let .size(sizeAnimations):
                return sizeAnimations.count
            case let .location(sizeAnimations):
                return sizeAnimations.count
            case let .rotation(sizeAnimations):
                return sizeAnimations.count
            }
    }
    
    func animationsOfType(_ sectionNumber: Int) -> [AnimationProperty] {
        let selectedAnimations = animationCategories[sectionNumber]
        switch selectedAnimations {
        case let .size(sizeAnimations):
            return sizeAnimations
        case let .location(sizeAnimations):
            return sizeAnimations
        case let .rotation(sizeAnimations):
            return sizeAnimations
        }
    }
    
    func saveAnimation(_ animation: AnimationParameters) {
        savedAnimations.append(animation)
    }
}







