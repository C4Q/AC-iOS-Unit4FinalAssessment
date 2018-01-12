//
//  StorageClient.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class StorageModel {
    private init() {}
    static let manager = StorageModel()
    static let settingsPath = "Settings.plist"
    
    private var settings = [Setting]() {
        didSet {
            saveSettings()
        }
    }
    
    private func DocDir() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func dataFilePath(forPath path: String) -> URL {
        return DocDir().appendingPathComponent(StorageModel.settingsPath)
    }
    
    private func saveSettings() {
        do {
            let data = try PropertyListEncoder().encode(settings)
            try data.write(to: dataFilePath(forPath: StorageModel.settingsPath), options: .atomic)
        } catch {
            print(error)
        }
    }
    
    public func loadSettings() {
        do {
            let data = try Data.init(contentsOf: dataFilePath(forPath: StorageModel.settingsPath))
            settings = try PropertyListDecoder().decode([Setting].self, from: data)
        } catch {
            print(error)
        }
    }
    
    public func addToSettings(setting: Setting) {
        settings.append(setting)
    }
    
    public func getSettings() -> [Setting] {
        return settings
    }
    
}

