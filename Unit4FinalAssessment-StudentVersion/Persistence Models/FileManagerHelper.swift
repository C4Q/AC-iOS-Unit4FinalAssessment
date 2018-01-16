//
//  FileManagerHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by Clint Mejia on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class FileManagerHelper {
    
    private var favoriteAnimations: [Animation] = [Animation(title: "default", settings: Settings(width: 0, height: 0, horizontalPosition: 0, verticalPosition: 0, xRotations: 10, yRotations: 10, zRotations: 10))] {
        didSet {
            saveToDisk()
        }
    }

    let favoriteAnimationPath = "userAnimationSettings.plist"

    private init() {}
    static let manager = FileManagerHelper()
    
    //MARK: - Private implementations
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func saveToDisk() {
        let propertyListEncoder = PropertyListEncoder()
        do {
            let encodedData = try propertyListEncoder.encode(favoriteAnimations)
            let phoneURL = dataFilePath(withPathName: favoriteAnimationPath)
            try encodedData.write(to: phoneURL, options: .atomic)
        }
        catch {
            print("Encoding error: " + error.localizedDescription)
        }
    }
    
    //MARK: - Public Implementations
    func checkForDuplicate(animation name: String) -> Bool {
        guard !favoriteAnimations.contains(where: { $0.title == name }) else { print("True"); return true }
        print("false")
        return false

    }
    func addNew(animation settings: Settings, named title: String) {
        let newSetting = Animation(title: title, settings: settings)
        return favoriteAnimations.append(newSetting)
    }
    
    func loadAnimationsFromDisk() {
        let propertyListDecoder = PropertyListDecoder()
        do {
            let phoneURL = dataFilePath(withPathName: favoriteAnimationPath)
            let encodedData = try Data(contentsOf: phoneURL)
            let results = try propertyListDecoder.decode([Animation].self, from: encodedData)
            self.favoriteAnimations = results
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func getAnimations() -> [Animation] {
        return favoriteAnimations
    }
}

