//
//  AnimationBrain.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Clint Mejia on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct Animation: Codable {
    let title: String
    let settings: Settings
}

class AnimationBrain {
    
    private init() {}
    static let manager = AnimationBrain()
    
    func addNew(animation settings: Settings, named: String) {
        FileManagerHelper.manager.addNew(animation: settings, named: named)
    }
    
    func loadAnimationsFromDisk() {
        return FileManagerHelper.manager.loadAnimationsFromDisk()
    }
    
    func checkForDuplicate(animation name: String) -> Bool {
        return FileManagerHelper.manager.checkForDuplicate(animation: name)
    }
    
    func getAnimations() -> [Animation] {
        return FileManagerHelper.manager.getAnimations()
    }
}



