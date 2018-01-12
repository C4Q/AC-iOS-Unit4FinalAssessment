//
//  FileManager.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class FileManagerHelper {
    private init() {}
    static let manager = FileManagerHelper()
    var savedSettingsPath = "savedSettings.plist"
    
    private var savedSettings = [[AnimationProperty]]() {
        didSet {
            saveAnimationSettings()
        }
    }
    
    private var savedNames = [String]() {
        didSet{
            saveAnimationSettings()
        }
    }
    
    func saveUserAnimationSettings (with string: String, and settings: [AnimationProperty]) {
        
        let url = dataFilePath(withPathName: string)
        do {
            let encodedData = try PropertyListEncoder().encode(settings)
            try encodedData.write(to: url)
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    func saveAnimationSettings() {
        let filePath = dataFilePath(withPathName: savedSettingsPath)
        do {
            let data = try PropertyListEncoder().encode(savedSettings)
            try data.write(to: filePath)
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    func addNewSetting(setting: [AnimationProperty]) {
        savedSettings.append(setting)
    }
    
    func addSettingName(name: String) {
        savedNames.append(name)
    }
    
    func loadAllAnimations() {
        let filePath = dataFilePath(withPathName: savedSettingsPath)
        do {
            let data = try Data.init(contentsOf: filePath)
            let savedSettings = try PropertyListDecoder().decode([[AnimationProperty]].self, from: data)
            self.savedSettings = savedSettings
        }
            
        catch let error {
            print(error)
        }
    }
    
    func getAllAnimations() -> [[AnimationProperty]] {
        return savedSettings
    }
    
    func getAllAnimationNames() -> [String] {
        return savedNames
    }

    
    
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    
}
