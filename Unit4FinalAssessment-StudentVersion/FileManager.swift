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

        }
    }
    
    private func saveUserAnimationSettings (with string: String, and settings: [AnimationProperty]) {
     
        let url = dataFilePath(withPathName: string)
       
        
        do {

        }
        catch {
            
        }
    }
    

    
    func saveAnimationNames() {
        
    }
    
    private func loadSettings() {
        do {
            
        }
        
        catch {
            
        }
    }
    
    func addNewSetting() {
        
    }
    
    
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    
}
