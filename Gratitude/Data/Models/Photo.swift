//
//  Photo.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation
import RealmSwift

class Photo: Object {
    @objc dynamic var primaryKey = UUID().uuidString
    @objc dynamic var id: Int = 1
    @objc dynamic var caption: String?
    @objc dynamic var url = ""
    @objc dynamic var thumbUrl = ""
    @objc dynamic var isLocalImage: Bool = false
    
    override static func primaryKey() -> String? {
        return "primaryKey"
    }
}
