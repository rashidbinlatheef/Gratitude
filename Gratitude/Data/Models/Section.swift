//
//  Section.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation
import RealmSwift

class Section: Object {
    @objc dynamic var primaryKey = UUID().uuidString
    @objc dynamic var name = ""
    let photos = List<Photo>()
    
    override static func primaryKey() -> String? {
        return "primaryKey"
    }
}
