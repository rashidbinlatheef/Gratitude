//
//  ImageStore.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 14/09/22.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol ImageStore {
    func saveImageToDocumentsDirectory(_ image: UIImage) -> Int
    func imageUrlStringFor(_ path : String) -> String
    func removeImageWithId(_ id: Int)
}

class ImageStoreManager {
    static let sharedInstance = ImageStoreManager()
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    private init() {}
}

extension ImageStoreManager: ImageStore {
    func saveImageToDocumentsDirectory(_ image: UIImage) -> Int {
        let uniqueId = UUID().hashValue
        let fileURL = documentsDirectory.appendingPathComponent(String(uniqueId))
        if let data = image.jpegData(compressionQuality: 1.0), !FileManager.default.fileExists(atPath: fileURL.path){
            do {
                try data.write(to: fileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
        return uniqueId
    }
    
    func imageUrlStringFor(_ path : String) -> String {
        return documentsDirectory.absoluteString+path
    }
    
    func removeImageWithId(_ id: Int) {
        let fileManager = FileManager.default
        let NSDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let NSUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)
        guard let dirPath = paths.first else {
            return
        }
        let filePath = "\(dirPath)/\(id)"
        do {
            try fileManager.removeItem(atPath: filePath)
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
}
