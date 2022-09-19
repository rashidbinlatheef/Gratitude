// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class PexelAPIServiceMock: PexelAPIService {

    //MARK: - searchImages

    var searchImagesQuerryCompletionCallsCount = 0
    var searchImagesQuerryCompletionCalled: Bool {
        return searchImagesQuerryCompletionCallsCount > 0
    }
    var searchImagesQuerryCompletionReceivedArguments: (querry: String, completion: (Result<PexelPhotoSearchResponse, PexelNetworkingError>) -> Void)?
    var searchImagesQuerryCompletionReceivedInvocations: [(querry: String, completion: (Result<PexelPhotoSearchResponse, PexelNetworkingError>) -> Void)] = []
    var searchImagesQuerryCompletionClosure: ((String, @escaping (Result<PexelPhotoSearchResponse, PexelNetworkingError>) -> Void) -> Void)?

    func searchImages(querry: String, completion: @escaping (Result<PexelPhotoSearchResponse, PexelNetworkingError>) -> Void) {
        searchImagesQuerryCompletionCallsCount += 1
        searchImagesQuerryCompletionReceivedArguments = (querry: querry, completion: completion)
        searchImagesQuerryCompletionReceivedInvocations.append((querry: querry, completion: completion))
        searchImagesQuerryCompletionClosure?(querry, completion)
    }

}
