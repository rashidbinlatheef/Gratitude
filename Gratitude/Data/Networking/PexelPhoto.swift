//
//  PexelPhoto.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import Foundation

class PexelPhoto: Codable {
    init(id: Int, src: PexelPhotoImageSource) {
        self.id = id
        self.src = src
    }
    
    let id: Int
    let src: PexelPhotoImageSource
        
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: CodingKeys.id)
        src = try container.decode(PexelPhotoImageSource.self, forKey: CodingKeys.src)
    }
}

class PexelPhotoImageSource: Codable {
    init(original: String, medium: String, small: String) {
        self.original = original
        self.medium = medium
        self.small = small
    }
    
    let original: String
    let medium: String
    let small: String    
}
