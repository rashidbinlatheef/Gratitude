//
//  Photo+Example.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

import Foundation
@testable import Gratitude
import RealmSwift

extension Photo {
    static func generate(
        id: Int = UUID().hashValue,
        caption: String? = "this is sample image",
        url: String = "https://previews.123rf.com/images/arcady31/arcady311108/arcady31110800017/10101139-sample-stamp.jpg",
        thumbUrl: String = "https://previews.123rf.com/images/arcady31/arcady311108/arcady31110800017/10101139-sample-stamp.jpg",
        isLocalImage: Bool = false
    ) -> Photo{
       let photo = Photo()
        photo.id = id
        photo.caption = caption
        photo.url = url
        photo.thumbUrl = thumbUrl
        photo.isLocalImage = isLocalImage
        return photo
    }
}
