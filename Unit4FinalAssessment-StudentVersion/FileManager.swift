//
//  FileManager.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Richard Crichlow on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class FileManagerHelper {
    private init() {}
    
    static let manager = FileManagerHelper()
    
    
    
    //returns documents directory path for app sandbox
    private func documentsDirectory() -> URL {
        //this is finding the document folder in the app
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //return document folder url path
        return paths[0]
    }
    
    // returns the path for supplied name from the documents directory
    private func dataFilePath(withPathName path: String) -> URL {
        //now you can write to the file/pathName you pass in! (If the file name doesn't exsist, it will create it)
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
}
extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
