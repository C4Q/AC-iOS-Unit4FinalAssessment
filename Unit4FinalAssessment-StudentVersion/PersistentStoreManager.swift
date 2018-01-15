//
//  PersistentStoreManager.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Lisa J on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class PersistentStoreManager {
    
    static let kPathname = "SavedSetting.plist"
    
    // singleton
    private init(){}
    static let manager = PersistentStoreManager()
    
    private var savedSettings = [SavedSetting]() {
        didSet{
            saveToDisk()
        }
    }
    
    // returns documents directory path for app sandbox
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // /documents/SavedSetting.plist
    // returns the path for supplied name from the dcouments directory
    private func dataFilePath(withPathName path: String) -> URL {
        return PersistentStoreManager.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    // save to documents directory
    // write to path: /Documents/
    private func saveToDisk() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(savedSettings)
            // Does the writing to disk
            try data.write(to: dataFilePath(withPathName: PersistentStoreManager.kPathname), options: .atomic)
        } catch {
            print("encoding error: \(error.localizedDescription)")
        }
        print("\n==================================================")
        print(documentsDirectory())
        print("===================================================\n")
    }
    
    // load from documents directory
    public func load() {
        // what's the path we are reading from?
        let path = dataFilePath(withPathName: PersistentStoreManager.kPathname)
        let decoder = PropertyListDecoder()
        do {
            let data = try Data.init(contentsOf: path)
            savedSettings = try decoder.decode([SavedSetting].self, from: data)
        } catch {
            print("decoding error: \(error.localizedDescription)")
        }
    }
    
    public func addSavedSettingToList(savedSetting setting: SavedSetting) {
        
        savedSettings.append(setting)
        }
    
    // read
    
    public func getSettings() -> [SavedSetting] {
        
        return savedSettings
        
    }
    
    
   
}

