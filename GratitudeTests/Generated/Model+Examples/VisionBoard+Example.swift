//
//  VisionBoard+Example.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

import Foundation
@testable import Gratitude
import RealmSwift

extension VisionBoard {
    static func generate(
        name: String = "My Board",
        userName: String = "john",
        sections: [Section] = [.generate(), .generate()]
    ) -> VisionBoard {
       let board = VisionBoard()
        board.name = name
        board.userName = userName
        board.sections.append(objectsIn: sections)
        return board
    }
}
