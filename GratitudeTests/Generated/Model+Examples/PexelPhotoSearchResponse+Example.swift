//
//  PexelPhotoSearchResponse+Example.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

import Foundation
@testable import Gratitude

extension PexelPhotoSearchResponse {
    static func generate(
        totalResults: Int = 100,
        page: Int = 2,
        perPage: Int = 5,
        photos: [PexelPhoto] = [
            .generate(id: 1),
            .generate(id: 2),
            .generate(id:31),
            .generate(id: 4),
            .generate(id: 5)
        ],
        prevPage: String? = "some url'",
        nextPage: String? = "some url"
    ) -> PexelPhotoSearchResponse {
        PexelPhotoSearchResponse(
            totalResults: totalResults,
            page: page,
            perPage: perPage,
            photos: photos,
            prevPage: prevPage,
            nextPage: nextPage
        )
    }
}
