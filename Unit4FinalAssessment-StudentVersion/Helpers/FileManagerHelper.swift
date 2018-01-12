//
//  FileManagerHelper.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Luis Calle on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class FileManagerHelper {
    
    private init() { }
    static let shared = FileManagerHelper()
    
    let savedAnimationsPath = "savedAnimation.plist"
    
    var savedAnimationsArray = [SavedAnimation]() {
        didSet {
            saveSavedAnimations()
        }
    }
    
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.shared.documentsDirectory().appendingPathComponent(path)
    }
    
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
        return paths[0]
    }
    
    public func isAnimationNameAlreadySaved(animation: SavedAnimation) -> Bool {
        let animationIndexFound = savedAnimationsArray.index{ $0.animationName == animation.animationName }
        if animationIndexFound != nil { return true }
        else { return false }
    }
    
    func saveAnimation(with animation: SavedAnimation) {
        if isAnimationNameAlreadySaved(animation: animation) { return }
        savedAnimationsArray.append(animation)
    }
    
    private func saveSavedAnimations() {
        let propertyListEncoder = PropertyListEncoder()
        do {
            let encodedData = try propertyListEncoder.encode(savedAnimationsArray)
            let phoneURL = dataFilePath(withPathName: savedAnimationsPath)
            try encodedData.write(to: phoneURL, options: .atomic)
        }
        catch {
            print("Encoding error: " + error.localizedDescription)
        }
    }
    
    func loadSavedAnimations() {
        let propertyListDecoder = PropertyListDecoder()
        do {
            let phoneURL = dataFilePath(withPathName: savedAnimationsPath)
            let encodedData = try Data(contentsOf: phoneURL)
            let savedAnimations = try propertyListDecoder.decode([SavedAnimation].self, from: encodedData)
            savedAnimationsArray = savedAnimations
        }
        catch {
            print("Decoding error: " + error.localizedDescription)
        }
    }
    
    public func getSavedAnimations() -> [SavedAnimation] {
        return savedAnimationsArray
    }
    
}

