//
//  VisionBoard.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation
import RealmSwift

let visionBoardUniqueId: Int = 12345

class VisionBoard: Object {
    @objc dynamic var primaryKey = visionBoardUniqueId
    @objc dynamic var name = ""
    @objc dynamic var userName = ""
    let sections = List<Section>()
        
    override static func primaryKey() -> String? {
        return "primaryKey"
    }
}
