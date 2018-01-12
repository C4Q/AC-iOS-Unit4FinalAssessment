//
//  SavedSettings.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation



struct SavedSettings: Codable {
    var name: String
    var widthMultiplier: Double
    var heightMultiplier: Double
    var horizontalOffset: Double
    var verticalOffset: Double
    var xAxisFlip: Double
    var yAxisFlip: Double
    var zAxisFlip: Double
}
