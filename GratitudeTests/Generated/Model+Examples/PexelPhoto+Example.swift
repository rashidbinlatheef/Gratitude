//
//  PexelPhoto+Example.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

import Foundation
@testable import Gratitude

extension PexelPhoto {
    static func generate(
        id: Int = 1234,
        src: PexelPhotoImageSource = .generate()
       ) -> PexelPhoto {
        PexelPhoto(id: id, src: src)
    }
}

extension PexelPhotoImageSource {
    static func generate(
        original: String = "https://previews.123rf.com/images/arcady31/arcady311108/arcady31110800017/10101139-sample-stamp.jpg",
        medium: String = "https://previews.123rf.com/images/arcady31/arcady311108/arcady31110800017/10101139-sample-stamp.jpg",
        small: String = "https://previews.123rf.com/images/arcady31/arcady311108/arcady31110800017/10101139-sample-stamp.jpg"
    ) -> PexelPhotoImageSource {
        PexelPhotoImageSource(
            original: original,
            medium: medium,
            small: small
        )
    }
}
