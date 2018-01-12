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
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // /documents/SavedSetting.plist
    // returns the path for supplied name from the dcouments directory
    func dataFilePath(withPathName path: String) -> URL {
        return PersistentStoreManager.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    // save to documents directory
    // write to path: /Documents/
    func saveToDisk() {
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
    func load() {
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
    
    // does 2 tasks:
    // 1. stores image in documents folder
    // 2. appends favorite item to array
//    func addToFavorites(pixabay: Hits, cityName: String, andImage image: UIImage) -> Bool {
//        // checking for uniqueness
//        let indexExist = self.favorites.index{ $0.webformatURL == pixabay.webformatURL}
//        if indexExist != nil { print("FAVORITE EXIST"); return false }
//        
//        // 1) save image from favorite photo
//        let success = storeImageToDisk(image: image, andFavorites: pixabay)
//        if !success { return false }
//        
//        // 2) save favorite object
//        let newFavorite = Favorite.init(webformatURL: pixabay.webformatURL, cityName: cityName, id: pixabay.id)
//        self.favorites.append(newFavorite)
//        return true
//    }
//    
//    // store image
//    func storeImageToDisk(image: UIImage, andFavorites imgURL: Hits) -> Bool {
//        // packing data from image
//        guard let imageData = UIImagePNGRepresentation(image) else { return false }
//        
//        // writing and saving to documents folder
//        
//        // 1) save image from favorite photo
//        let imageURL = PersistentStoreManager.manager.dataFilePath(withPathName: "\(imgURL.id)")
//        do {
//            try imageData.write(to: imageURL)
//        } catch {
//            print("image saving error: \(error.localizedDescription)")
//        }
//        return true
//    }
//    
}

