//
//  PexelPhotoSearchResponse.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import Foundation

struct PexelPhotoSearchResponse: Codable {
    init(
        totalResults: Int,
        page: Int, perPage: Int,
        photos: [PexelPhoto],
        prevPage: String?,
        nextPage: String?
    ) {
        self.totalResults = totalResults
        self.page = page
        self.perPage = perPage
        self.photos = photos
        self.prevPage = prevPage
        self.nextPage = nextPage
    }
    
    let totalResults: Int
    let page: Int
    let perPage: Int
    let photos: [PexelPhoto]
    let prevPage: String?
    let nextPage: String?
}
