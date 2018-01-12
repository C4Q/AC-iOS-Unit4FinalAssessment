//
//  PersistentStoreManager.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class PersistentStoreManager {
    static let kPathname = "Favorites.plist"
    
    // singleton
    private init(){}
    static let manager = PersistentStoreManager()
    
    private var favorites = [SavedSettings]() {
        didSet{
            saveToDisk()
        }
        
    }
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath(withPathName path: String) -> URL {
        return PersistentStoreManager.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    func saveToDisk() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(favorites)
            // Does the writing to disk
            try data.write(to: dataFilePath(withPathName: PersistentStoreManager.kPathname), options: .atomic)
        } catch {
            print("encoding error: \(error.localizedDescription)")
        }
        print("\n==================================================")
        print(documentsDirectory())
        print("===================================================\n")
    }
    
    func load() {
        // what's the path we are reading from?
        let path = dataFilePath(withPathName: PersistentStoreManager.kPathname)
        let decoder = PropertyListDecoder()
        do {
            let data = try Data.init(contentsOf: path)
            favorites = try decoder.decode([SavedSettings].self, from: data)
        } catch {
            print("decoding error: \(error.localizedDescription)")
        }
    }
    
    func addToFavorites(savedSettings: SavedSettings) -> Bool  {
        // checking for uniqueness
        let indexExist = favorites.index{ $0.name == savedSettings.name }
        if indexExist != nil { print("FAVORITE EXIST"); return false }
        favorites.append(savedSettings)
        return true
    }
    
    func getFavorites() -> [SavedSettings] {
        load()
        return favorites
    }
    
}
