//
//  SavedAnimation.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Luis Calle on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct SavedAnimation: Codable {
    let animationName: String
    let userAnimations: [UserAnimation]
}
