//
//  Section+Example.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

import Foundation
@testable import Gratitude
import RealmSwift

extension Section {
    static func generate(
        name: String = "Summer Trip",
        photos: [Photo] = [.generate(), .generate()]
    ) -> Section{
       let section = Section()
        section.name = name
        section.photos.append(objectsIn: photos)
        return section
    }
}
