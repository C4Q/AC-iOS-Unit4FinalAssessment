//
//  FileManager.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class FileManagerHelper {
    
    static let kPathname = "SavedSettings.plist"
    
    private init(){}
    static let manager = FileManagerHelper()
    
    private var savedSettings = [[CustomSetting]]() {
        didSet {
            saveToDisk()
        }
    }
    
    // returns documents directory path for app sandbox
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // returns the path for supplied name from the documents directory
    func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    // save to documents directory
    // write to path: /Documents/
    func saveToDisk() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(savedSettings)
            // Does the writing to disk
            try data.write(to: dataFilePath(withPathName: FileManagerHelper.kPathname), options: .atomic)
        } catch {
            print("encoding error: \(error.localizedDescription)")
        }
        print("\n==================================================")
        print(documentsDirectory())
        print("===================================================\n")
    }
    
    // load from documents directory
    func load() {
        // what's the path we are reading from?
        let path = dataFilePath(withPathName: FileManagerHelper.kPathname)
        let decoder = PropertyListDecoder()
        do {
            let data = try Data.init(contentsOf: path)
            savedSettings = try decoder.decode([[CustomSetting]].self, from: data)
        } catch {
            print("decoding error: \(error.localizedDescription)")
        }
    }
    
    
    func addToSettings(name: String, andSetting setting: CustomSetting) -> Bool {
        
        // save a custom setting array with name
        let success = storeSettingToDisk(name: name, andSetting: setting)
        if !success {return false}
        
        // save the custom setting object
        let newSettingDetails = CustomSetting.init(widthMultiplier: setting.widthMultiplier, heightMultiplier: setting.heightMultiplier, horizontalOffset: setting.horizontalOffset, verticalOffset: setting.verticalOffset, numberOfFlips: setting.numberOfFlips)
        
//        let newSettingName = name
//
        savedSettings.append([newSettingDetails])
        return true
    }
    
    // store setting
    func storeSettingToDisk(name: String, andSetting setting: CustomSetting) -> Bool {
        // writing and saving to documents folder
        
        // 1) save image from favorite photo
        let newSetting = FileManagerHelper.manager.dataFilePath(withPathName: name)
        
        do {
//            try setting.write(to: newSetting)
        } catch {
            print("custom setting saving error: \(error.localizedDescription)")
        }
        return true
    }
    
    func getSettings() -> [[CustomSetting]] {
        return savedSettings
    }
    
    
}
