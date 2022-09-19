//
//  DataManager.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation
import RealmSwift

//sourcery: AutoMockable
protocol DataManager {
    func getVisionBoard() -> VisionBoard?
    func createVisionBoardWithName(_ name: String, userName: String, sectionName: String)
    func addSectionWithName(_ name: String)
    func updateSection(_ section: Section, images: [ImagePickerItem])
}

final class DataManagerService {
    static let sharedInstance: DataManagerService = DataManagerService()
    private let imageStore: ImageStore

    private init(
        imageStore: ImageStore = ImageStoreManager.sharedInstance
    ) {
        self.imageStore = imageStore
    }
}

extension DataManagerService: DataManager {
    func getVisionBoard() -> VisionBoard? {
        let realm = try? Realm()
        let visionBoard = realm?.object(ofType: VisionBoard.self, forPrimaryKey: visionBoardUniqueId)
        return visionBoard
    }
    
    func createVisionBoardWithName(_ name: String, userName: String, sectionName: String) {
        updateVisionBoardWith(visionBoardName: name, userName: userName, sectionName: sectionName)
    }
    
    func addSectionWithName(_ name: String) {
        updateVisionBoardWith(sectionName: name)
    }
    
    func updateSection(_ section: Section, images: [ImagePickerItem]) {
        let photosList = List<Photo>()
        let realm = try? Realm()
            
        // Delete removed local images
        for photo in section.photos where photo.isLocalImage {
            if !images.contains(where: {$0.imageId == photo.id }) {
                // delete local image
                imageStore.removeImageWithId(photo.id)
            }
        }
        
        try? realm?.write {
            for image in images {
                let photo: Photo
                if let tempPhoto = section.photos.where({$0.id == image.imageId}).first {
                    photo = tempPhoto
                } else {
                    photo = Photo()
                    photo.id = image.imageId
                }
                photo.url = image.imageUrl
                photo.thumbUrl = image.thumbUrl
                photo.caption = image.caption
                photo.isLocalImage = image.isLocal
                photosList.append(photo)
            }
            section.photos.removeAll()
            section.photos.append(objectsIn: photosList)
            realm?.add(section, update: .modified)
            realm?.add(photosList, update: .modified)
        }
    }
}

private extension DataManagerService {
    func getVisionBoardInstnce() -> VisionBoard {
        getVisionBoard() ?? VisionBoard()
    }
    
    func updateVisionBoardWith(visionBoardName: String? = nil, userName: String? = nil, sectionName: String) {
        let visionBoard = getVisionBoardInstnce()
        if let visionBoardName = visionBoardName {
            visionBoard.name = visionBoardName
        }
        if let userName = userName {
            visionBoard.userName = userName
        }
        
        let section = Section()
        section.name = sectionName
        
        let realm = try? Realm()
        try? realm?.write{
            visionBoard.sections.append(section)
            realm?.add(visionBoard, update: .modified)
            realm?.add(section, update: .modified)
        }
    }
    
    func realmDeleteAllClassObjects() {
        do {
            let realm = try Realm()
            
                        let visionBoards = realm.objects(VisionBoard.self)
                        let sections = realm.objects(Section.self)
            let photos = realm.objects(Photo.self)
            
            try! realm.write {
                                realm.delete(visionBoards)
                                realm.delete(sections)
                realm.delete(photos)
            }
        } catch let error as NSError {
            // handle error
            print("error - \(error.localizedDescription)")
        }
    }
}
