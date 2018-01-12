//
//  Persistance.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Masai Young on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class KeyedArchiverClient {
    
    static let shared = KeyedArchiverClient()
    private init() {}
    
    static let plistPathName = "SavedAnimations.plist"
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths.first!
    }
    
    private func dataFilePath(pathName: String) -> URL {
        return KeyedArchiverClient.shared.documentsDirectory().appendingPathComponent(pathName)
    }
    
        private var animations = [AnimationParameters]() {
            didSet {
                saveFavorites()
            }
        }
    
    //    save
    func saveFavorites() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(animations)
            try data.write(to: dataFilePath(pathName: KeyedArchiverClient.plistPathName), options: .atomic)
        } catch {
            print("Encoder error: \(error.localizedDescription)")
        }
    }
    
    //    load
    func loadFavorites() {
        let decoder = PropertyListDecoder()
        let path = dataFilePath(pathName: KeyedArchiverClient.plistPathName)
        do {
            let data = try Data.init(contentsOf: path)
            animations = try decoder.decode([AnimationParameters].self, from: data)
        } catch {
            print("Decoder error: \(error.localizedDescription)")
        }
    }
    
    //    add
    func setFavorites(listOfAnimations: [AnimationParameters]) {
        animations = listOfAnimations
    }
    
    //    read
    func fetchAnimations() -> [AnimationParameters] {
        return animations
    }
    
    
}

