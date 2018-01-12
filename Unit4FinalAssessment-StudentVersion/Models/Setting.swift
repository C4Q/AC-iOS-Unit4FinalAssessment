//
//  Settings.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

struct Setting: Codable {
    let name: String
    let sizeSettings: SizeSettings
    let positionSettings: PositionSettings
    let otherSettings: OtherSettings
    
    static let `default` = Setting(name: "", sizeSettings: SizeSettings(width:0, height: 0) , positionSettings: PositionSettings(horizontalOffset: 0, verticalOffset: 0), otherSettings: OtherSettings(numberOfXFlips: 0, numberOfYFlips: 0, numberOfZFlips: 0))
}

struct SizeSettings: Codable {
    let width: CGFloat
    let height: CGFloat
}

struct PositionSettings: Codable {
    let horizontalOffset: CGFloat
    let verticalOffset: CGFloat
}

struct OtherSettings: Codable {
    let numberOfXFlips: Int
    let numberOfYFlips: Int
    let numberOfZFlips: Int
}





