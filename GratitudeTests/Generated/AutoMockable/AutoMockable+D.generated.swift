// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class DataManagerMock: DataManager {

    //MARK: - getVisionBoard

    var getVisionBoardCallsCount = 0
    var getVisionBoardCalled: Bool {
        return getVisionBoardCallsCount > 0
    }
    var getVisionBoardReturnValue: VisionBoard?
    var getVisionBoardClosure: (() -> VisionBoard?)?

    func getVisionBoard() -> VisionBoard? {
        getVisionBoardCallsCount += 1
        return getVisionBoardClosure.map({ $0() }) ?? getVisionBoardReturnValue
    }

    //MARK: - createVisionBoardWithName

    var createVisionBoardWithNameUserNameSectionNameCallsCount = 0
    var createVisionBoardWithNameUserNameSectionNameCalled: Bool {
        return createVisionBoardWithNameUserNameSectionNameCallsCount > 0
    }
    var createVisionBoardWithNameUserNameSectionNameReceivedArguments: (name: String, userName: String, sectionName: String)?
    var createVisionBoardWithNameUserNameSectionNameReceivedInvocations: [(name: String, userName: String, sectionName: String)] = []
    var createVisionBoardWithNameUserNameSectionNameClosure: ((String, String, String) -> Void)?

    func createVisionBoardWithName(_ name: String, userName: String, sectionName: String) {
        createVisionBoardWithNameUserNameSectionNameCallsCount += 1
        createVisionBoardWithNameUserNameSectionNameReceivedArguments = (name: name, userName: userName, sectionName: sectionName)
        createVisionBoardWithNameUserNameSectionNameReceivedInvocations.append((name: name, userName: userName, sectionName: sectionName))
        createVisionBoardWithNameUserNameSectionNameClosure?(name, userName, sectionName)
    }

    //MARK: - addSectionWithName

    var addSectionWithNameCallsCount = 0
    var addSectionWithNameCalled: Bool {
        return addSectionWithNameCallsCount > 0
    }
    var addSectionWithNameReceivedName: String?
    var addSectionWithNameReceivedInvocations: [String] = []
    var addSectionWithNameClosure: ((String) -> Void)?

    func addSectionWithName(_ name: String) {
        addSectionWithNameCallsCount += 1
        addSectionWithNameReceivedName = name
        addSectionWithNameReceivedInvocations.append(name)
        addSectionWithNameClosure?(name)
    }

    //MARK: - updateSection

    var updateSectionImagesCallsCount = 0
    var updateSectionImagesCalled: Bool {
        return updateSectionImagesCallsCount > 0
    }
    var updateSectionImagesReceivedArguments: (section: Section, images: [ImagePickerItem])?
    var updateSectionImagesReceivedInvocations: [(section: Section, images: [ImagePickerItem])] = []
    var updateSectionImagesClosure: ((Section, [ImagePickerItem]) -> Void)?

    func updateSection(_ section: Section, images: [ImagePickerItem]) {
        updateSectionImagesCallsCount += 1
        updateSectionImagesReceivedArguments = (section: section, images: images)
        updateSectionImagesReceivedInvocations.append((section: section, images: images))
        updateSectionImagesClosure?(section, images)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class DidLoadInteractingMock: DidLoadInteracting {

    //MARK: - didLoad

    var didLoadCallsCount = 0
    var didLoadCalled: Bool {
        return didLoadCallsCount > 0
    }
    var didLoadClosure: (() -> Void)?

    func didLoad() {
        didLoadCallsCount += 1
        didLoadClosure?()
    }

}
