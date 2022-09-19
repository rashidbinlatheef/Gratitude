//
//  ImagePickerItem.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 13/09/22.
//

import Foundation

class ImagePickerItem: Equatable {
    static func == (lhs: ImagePickerItem, rhs: ImagePickerItem) -> Bool {
        lhs.imageId == rhs.imageId &&
        lhs.thumbUrl == rhs.thumbUrl &&
        lhs.imageUrl == rhs.imageUrl &&
        lhs.caption == rhs.caption &&
        lhs.isLocal == rhs.isLocal
    }
    
    let imageId: Int
    let thumbUrl: String
    let imageUrl: String
    var caption: String?
    var isLocal: Bool = false

    init(
        imageId: Int,
        thumbUrl: String,
        imageUrl: String,
        caption: String? = nil,
        isLocal: Bool = false
    ) {
        self.imageId = imageId
        self.thumbUrl = thumbUrl
        self.imageUrl = imageUrl
        self.caption = caption
        self.isLocal = isLocal
    }
}

