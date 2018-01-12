//
//  UserDefaultsHelper.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
class UserDefaultsHelper {
    private init() {}
    static let manager = UserDefaultsHelper()
    let nameKey = "Property"
    func save(name: AnimationProperty) {
        UserDefaults.standard.setValue(name, forKey: nameKey)
    }
    func getProperty() -> AnimationProperty? {
        return UserDefaults.standard.object(forKey: nameKey) as? AnimationProperty
    }
}
