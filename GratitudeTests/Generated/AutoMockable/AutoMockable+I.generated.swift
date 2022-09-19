// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class ImagePickerDelegateMock: ImagePickerDelegate {

    //MARK: - didPickImage

    var didPickImageCallsCount = 0
    var didPickImageCalled: Bool {
        return didPickImageCallsCount > 0
    }
    var didPickImageReceivedImage: UIImage?
    var didPickImageReceivedInvocations: [UIImage?] = []
    var didPickImageClosure: ((UIImage?) -> Void)?

    func didPickImage(_ image: UIImage?) {
        didPickImageCallsCount += 1
        didPickImageReceivedImage = image
        didPickImageReceivedInvocations.append(image)
        didPickImageClosure?(image)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class ImageStoreMock: ImageStore {

    //MARK: - saveImageToDocumentsDirectory

    var saveImageToDocumentsDirectoryCallsCount = 0
    var saveImageToDocumentsDirectoryCalled: Bool {
        return saveImageToDocumentsDirectoryCallsCount > 0
    }
    var saveImageToDocumentsDirectoryReceivedImage: UIImage?
    var saveImageToDocumentsDirectoryReceivedInvocations: [UIImage] = []
    var saveImageToDocumentsDirectoryReturnValue: Int!
    var saveImageToDocumentsDirectoryClosure: ((UIImage) -> Int)?

    func saveImageToDocumentsDirectory(_ image: UIImage) -> Int {
        saveImageToDocumentsDirectoryCallsCount += 1
        saveImageToDocumentsDirectoryReceivedImage = image
        saveImageToDocumentsDirectoryReceivedInvocations.append(image)
        return saveImageToDocumentsDirectoryClosure.map({ $0(image) }) ?? saveImageToDocumentsDirectoryReturnValue
    }

    //MARK: - imageUrlStringFor

    var imageUrlStringForCallsCount = 0
    var imageUrlStringForCalled: Bool {
        return imageUrlStringForCallsCount > 0
    }
    var imageUrlStringForReceivedPath: String?
    var imageUrlStringForReceivedInvocations: [String] = []
    var imageUrlStringForReturnValue: String!
    var imageUrlStringForClosure: ((String) -> String)?

    func imageUrlStringFor(_ path: String) -> String {
        imageUrlStringForCallsCount += 1
        imageUrlStringForReceivedPath = path
        imageUrlStringForReceivedInvocations.append(path)
        return imageUrlStringForClosure.map({ $0(path) }) ?? imageUrlStringForReturnValue
    }

    //MARK: - removeImageWithId

    var removeImageWithIdCallsCount = 0
    var removeImageWithIdCalled: Bool {
        return removeImageWithIdCallsCount > 0
    }
    var removeImageWithIdReceivedId: Int?
    var removeImageWithIdReceivedInvocations: [Int] = []
    var removeImageWithIdClosure: ((Int) -> Void)?

    func removeImageWithId(_ id: Int) {
        removeImageWithIdCallsCount += 1
        removeImageWithIdReceivedId = id
        removeImageWithIdReceivedInvocations.append(id)
        removeImageWithIdClosure?(id)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class IntroductionInteractingMock: IntroductionInteracting {

    //MARK: - handleBuildVisionBoardButtonTap

    var handleBuildVisionBoardButtonTapCallsCount = 0
    var handleBuildVisionBoardButtonTapCalled: Bool {
        return handleBuildVisionBoardButtonTapCallsCount > 0
    }
    var handleBuildVisionBoardButtonTapClosure: (() -> Void)?

    func handleBuildVisionBoardButtonTap() {
        handleBuildVisionBoardButtonTapCallsCount += 1
        handleBuildVisionBoardButtonTapClosure?()
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class IntroductionSceneDelegateMock: IntroductionSceneDelegate {

    //MARK: - continueWithBuildingVisionBoard

    var continueWithBuildingVisionBoardCallsCount = 0
    var continueWithBuildingVisionBoardCalled: Bool {
        return continueWithBuildingVisionBoardCallsCount > 0
    }
    var continueWithBuildingVisionBoardClosure: (() -> Void)?

    func continueWithBuildingVisionBoard() {
        continueWithBuildingVisionBoardCallsCount += 1
        continueWithBuildingVisionBoardClosure?()
    }

}
