//
//  FileManagerHelper.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
class FileManagerHelper {
    private init() {}
    let animationPath = "myAnimation.plist"
    static let manager = FileManagerHelper()
    
    
    private var animationSaved = [[AnimationProperty]]() {
        didSet {
            saveAnimation()
        }
    }
    
    func addNew(newFavoriteImage: [AnimationProperty]) {
        animationSaved.append(newFavoriteImage)
    }
    func getAllAnimations() -> [[AnimationProperty]] {
        return animationSaved
    }
    
    private func saveAnimation() {
        let propertyListEncoder = PropertyListEncoder()
        do {
            let encodedData = try propertyListEncoder.encode(animationSaved)
            let animationURL = dataFilePath(withPathName: animationPath)
            try encodedData.write(to: animationURL, options: .atomic)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadAnimations() {
        let propertyListDecoder = PropertyListDecoder()
        do {
            let animationURL = dataFilePath(withPathName: animationPath)
            let encodedData = try Data(contentsOf: animationURL)
            let savedAnimations = try propertyListDecoder.decode([[AnimationProperty]].self, from: encodedData)
            animationSaved = savedAnimations
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    //USE THIS ONE
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    //THIS IS ONLY FOR THE ABOVE METHOD
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
        return paths[0]
    }
}
