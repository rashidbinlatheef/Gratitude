//
//  ImagePickerItem+Example.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

import Foundation
@testable import Gratitude

extension ImagePickerItem {
    static func generate(
        imageId: Int = UUID().hashValue,
        thumbUrl: String = "https://previews.123rf.com/images/arcady31/arcady311108/arcady31110800017/10101139-sample-stamp.jpg",
        imageUrl: String = "https://previews.123rf.com/images/arcady31/arcady311108/arcady31110800017/10101139-sample-stamp.jpg",
        caption: String? = "this is sample image",
        isLocal: Bool = false
    ) -> ImagePickerItem {
        ImagePickerItem(
            imageId: imageId,
            thumbUrl: thumbUrl,
            imageUrl: imageUrl,
            caption: caption,
            isLocal: isLocal
        )
    }
}
