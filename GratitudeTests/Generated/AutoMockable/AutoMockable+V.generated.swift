// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardInteractingMock: VisionBoardInteracting {

    //MARK: - handleAddAnotherButtonTap

    var handleAddAnotherButtonTapCallsCount = 0
    var handleAddAnotherButtonTapCalled: Bool {
        return handleAddAnotherButtonTapCallsCount > 0
    }
    var handleAddAnotherButtonTapClosure: (() -> Void)?

    func handleAddAnotherButtonTap() {
        handleAddAnotherButtonTapCallsCount += 1
        handleAddAnotherButtonTapClosure?()
    }

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

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardNameInputInteractingMock: VisionBoardNameInputInteracting {

    //MARK: - handleContinueButtonWithName

    var handleContinueButtonWithNameCallsCount = 0
    var handleContinueButtonWithNameCalled: Bool {
        return handleContinueButtonWithNameCallsCount > 0
    }
    var handleContinueButtonWithNameReceivedName: String?
    var handleContinueButtonWithNameReceivedInvocations: [String] = []
    var handleContinueButtonWithNameClosure: ((String) -> Void)?

    func handleContinueButtonWithName(_ name: String) {
        handleContinueButtonWithNameCallsCount += 1
        handleContinueButtonWithNameReceivedName = name
        handleContinueButtonWithNameReceivedInvocations.append(name)
        handleContinueButtonWithNameClosure?(name)
    }

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

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardNameInputPresentingMock: VisionBoardNameInputPresenting {

    //MARK: - display

    var displayHeaderNameListListActionHandlerCallsCount = 0
    var displayHeaderNameListListActionHandlerCalled: Bool {
        return displayHeaderNameListListActionHandlerCallsCount > 0
    }
    var displayHeaderNameListListActionHandlerReceivedArguments: (header: String, nameList: [String], listActionHandler: VisionBoardNamePickerListActionHandler)?
    var displayHeaderNameListListActionHandlerReceivedInvocations: [(header: String, nameList: [String], listActionHandler: VisionBoardNamePickerListActionHandler)] = []
    var displayHeaderNameListListActionHandlerClosure: ((String, [String], VisionBoardNamePickerListActionHandler) -> Void)?

    func display(header: String, nameList: [String], listActionHandler: VisionBoardNamePickerListActionHandler) {
        displayHeaderNameListListActionHandlerCallsCount += 1
        displayHeaderNameListListActionHandlerReceivedArguments = (header: header, nameList: nameList, listActionHandler: listActionHandler)
        displayHeaderNameListListActionHandlerReceivedInvocations.append((header: header, nameList: nameList, listActionHandler: listActionHandler))
        displayHeaderNameListListActionHandlerClosure?(header, nameList, listActionHandler)
    }

    //MARK: - updateVisionBoardName

    var updateVisionBoardNameCallsCount = 0
    var updateVisionBoardNameCalled: Bool {
        return updateVisionBoardNameCallsCount > 0
    }
    var updateVisionBoardNameReceivedVisionBoardName: String?
    var updateVisionBoardNameReceivedInvocations: [String] = []
    var updateVisionBoardNameClosure: ((String) -> Void)?

    func updateVisionBoardName(_ visionBoardName: String) {
        updateVisionBoardNameCallsCount += 1
        updateVisionBoardNameReceivedVisionBoardName = visionBoardName
        updateVisionBoardNameReceivedInvocations.append(visionBoardName)
        updateVisionBoardNameClosure?(visionBoardName)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardNameInputSceneDelegateMock: VisionBoardNameInputSceneDelegate {

    //MARK: - continueWithVisionBoardName

    var continueWithVisionBoardNameCallsCount = 0
    var continueWithVisionBoardNameCalled: Bool {
        return continueWithVisionBoardNameCallsCount > 0
    }
    var continueWithVisionBoardNameReceivedName: String?
    var continueWithVisionBoardNameReceivedInvocations: [String] = []
    var continueWithVisionBoardNameClosure: ((String) -> Void)?

    func continueWithVisionBoardName(_ name: String) {
        continueWithVisionBoardNameCallsCount += 1
        continueWithVisionBoardNameReceivedName = name
        continueWithVisionBoardNameReceivedInvocations.append(name)
        continueWithVisionBoardNameClosure?(name)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardNameInputViewableMock: VisionBoardNameInputViewable {

    //MARK: - updateVisionBoardName

    var updateVisionBoardNameCallsCount = 0
    var updateVisionBoardNameCalled: Bool {
        return updateVisionBoardNameCallsCount > 0
    }
    var updateVisionBoardNameReceivedVisionBoardName: String?
    var updateVisionBoardNameReceivedInvocations: [String] = []
    var updateVisionBoardNameClosure: ((String) -> Void)?

    func updateVisionBoardName(_ visionBoardName: String) {
        updateVisionBoardNameCallsCount += 1
        updateVisionBoardNameReceivedVisionBoardName = visionBoardName
        updateVisionBoardNameReceivedInvocations.append(visionBoardName)
        updateVisionBoardNameClosure?(visionBoardName)
    }

    //MARK: - render

    var renderHeaderListDataSourceCallsCount = 0
    var renderHeaderListDataSourceCalled: Bool {
        return renderHeaderListDataSourceCallsCount > 0
    }
    var renderHeaderListDataSourceReceivedArguments: (header: String, listDataSource: VisionBoardNamePickerListDataSourceProtocol)?
    var renderHeaderListDataSourceReceivedInvocations: [(header: String, listDataSource: VisionBoardNamePickerListDataSourceProtocol)] = []
    var renderHeaderListDataSourceClosure: ((String, VisionBoardNamePickerListDataSourceProtocol) -> Void)?

    func render(header: String, listDataSource: VisionBoardNamePickerListDataSourceProtocol) {
        renderHeaderListDataSourceCallsCount += 1
        renderHeaderListDataSourceReceivedArguments = (header: header, listDataSource: listDataSource)
        renderHeaderListDataSourceReceivedInvocations.append((header: header, listDataSource: listDataSource))
        renderHeaderListDataSourceClosure?(header, listDataSource)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardNamePickerListActionHandlerMock: VisionBoardNamePickerListActionHandler {

    //MARK: - didSelectName

    var didSelectNameCallsCount = 0
    var didSelectNameCalled: Bool {
        return didSelectNameCallsCount > 0
    }
    var didSelectNameReceivedName: String?
    var didSelectNameReceivedInvocations: [String] = []
    var didSelectNameClosure: ((String) -> Void)?

    func didSelectName(_ name: String) {
        didSelectNameCallsCount += 1
        didSelectNameReceivedName = name
        didSelectNameReceivedInvocations.append(name)
        didSelectNameClosure?(name)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardNamePickerListDataSourceProtocolMock: VisionBoardNamePickerListDataSourceProtocol {

    //MARK: - use

    var useCallsCount = 0
    var useCalled: Bool {
        return useCallsCount > 0
    }
    var useReceivedCollectionView: UICollectionView?
    var useReceivedInvocations: [UICollectionView] = []
    var useClosure: ((UICollectionView) -> Void)?

    func use(_ collectionView: UICollectionView) {
        useCallsCount += 1
        useReceivedCollectionView = collectionView
        useReceivedInvocations.append(collectionView)
        useClosure?(collectionView)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardPresentingMock: VisionBoardPresenting {

    //MARK: - display

    var displayVisionBoardTableActionHandlerCallsCount = 0
    var displayVisionBoardTableActionHandlerCalled: Bool {
        return displayVisionBoardTableActionHandlerCallsCount > 0
    }
    var displayVisionBoardTableActionHandlerReceivedArguments: (visionBoard: VisionBoard, tableActionHandler: VisionBoardTableActionHandler)?
    var displayVisionBoardTableActionHandlerReceivedInvocations: [(visionBoard: VisionBoard, tableActionHandler: VisionBoardTableActionHandler)] = []
    var displayVisionBoardTableActionHandlerClosure: ((VisionBoard, VisionBoardTableActionHandler) -> Void)?

    func display(visionBoard: VisionBoard, tableActionHandler: VisionBoardTableActionHandler) {
        displayVisionBoardTableActionHandlerCallsCount += 1
        displayVisionBoardTableActionHandlerReceivedArguments = (visionBoard: visionBoard, tableActionHandler: tableActionHandler)
        displayVisionBoardTableActionHandlerReceivedInvocations.append((visionBoard: visionBoard, tableActionHandler: tableActionHandler))
        displayVisionBoardTableActionHandlerClosure?(visionBoard, tableActionHandler)
    }

    //MARK: - refreshVisionBoard

    var refreshVisionBoardCallsCount = 0
    var refreshVisionBoardCalled: Bool {
        return refreshVisionBoardCallsCount > 0
    }
    var refreshVisionBoardReceivedVisionBoard: VisionBoard?
    var refreshVisionBoardReceivedInvocations: [VisionBoard] = []
    var refreshVisionBoardClosure: ((VisionBoard) -> Void)?

    func refreshVisionBoard(_ visionBoard: VisionBoard) {
        refreshVisionBoardCallsCount += 1
        refreshVisionBoardReceivedVisionBoard = visionBoard
        refreshVisionBoardReceivedInvocations.append(visionBoard)
        refreshVisionBoardClosure?(visionBoard)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardSceneDelegateMock: VisionBoardSceneDelegate {

    //MARK: - goToSectionDetailsScreen

    var goToSectionDetailsScreenCallsCount = 0
    var goToSectionDetailsScreenCalled: Bool {
        return goToSectionDetailsScreenCallsCount > 0
    }
    var goToSectionDetailsScreenReceivedSection: Section?
    var goToSectionDetailsScreenReceivedInvocations: [Section] = []
    var goToSectionDetailsScreenClosure: ((Section) -> Void)?

    func goToSectionDetailsScreen(_ section: Section) {
        goToSectionDetailsScreenCallsCount += 1
        goToSectionDetailsScreenReceivedSection = section
        goToSectionDetailsScreenReceivedInvocations.append(section)
        goToSectionDetailsScreenClosure?(section)
    }

    //MARK: - goToAddNewSection

    var goToAddNewSectionCallsCount = 0
    var goToAddNewSectionCalled: Bool {
        return goToAddNewSectionCallsCount > 0
    }
    var goToAddNewSectionClosure: (() -> Void)?

    func goToAddNewSection() {
        goToAddNewSectionCallsCount += 1
        goToAddNewSectionClosure?()
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardTableActionHandlerMock: VisionBoardTableActionHandler {

    //MARK: - editButtonTappedFor

    var editButtonTappedForCallsCount = 0
    var editButtonTappedForCalled: Bool {
        return editButtonTappedForCallsCount > 0
    }
    var editButtonTappedForReceivedSection: Section?
    var editButtonTappedForReceivedInvocations: [Section] = []
    var editButtonTappedForClosure: ((Section) -> Void)?

    func editButtonTappedFor(_ section: Section) {
        editButtonTappedForCallsCount += 1
        editButtonTappedForReceivedSection = section
        editButtonTappedForReceivedInvocations.append(section)
        editButtonTappedForClosure?(section)
    }

    //MARK: - addPhotoButtonTappedFor

    var addPhotoButtonTappedForCallsCount = 0
    var addPhotoButtonTappedForCalled: Bool {
        return addPhotoButtonTappedForCallsCount > 0
    }
    var addPhotoButtonTappedForReceivedSection: Section?
    var addPhotoButtonTappedForReceivedInvocations: [Section] = []
    var addPhotoButtonTappedForClosure: ((Section) -> Void)?

    func addPhotoButtonTappedFor(_ section: Section) {
        addPhotoButtonTappedForCallsCount += 1
        addPhotoButtonTappedForReceivedSection = section
        addPhotoButtonTappedForReceivedInvocations.append(section)
        addPhotoButtonTappedForClosure?(section)
    }

    //MARK: - didSelectSection

    var didSelectSectionCallsCount = 0
    var didSelectSectionCalled: Bool {
        return didSelectSectionCallsCount > 0
    }
    var didSelectSectionReceivedSection: Section?
    var didSelectSectionReceivedInvocations: [Section] = []
    var didSelectSectionClosure: ((Section) -> Void)?

    func didSelectSection(_ section: Section) {
        didSelectSectionCallsCount += 1
        didSelectSectionReceivedSection = section
        didSelectSectionReceivedInvocations.append(section)
        didSelectSectionClosure?(section)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardTableDataSourceProtocolMock: VisionBoardTableDataSourceProtocol {

    //MARK: - use

    var useCallsCount = 0
    var useCalled: Bool {
        return useCallsCount > 0
    }
    var useReceivedTableView: UITableView?
    var useReceivedInvocations: [UITableView] = []
    var useClosure: ((UITableView) -> Void)?

    func use(_ tableView: UITableView) {
        useCallsCount += 1
        useReceivedTableView = tableView
        useReceivedInvocations.append(tableView)
        useClosure?(tableView)
    }

    //MARK: - reloadViewWith

    var reloadViewWithCallsCount = 0
    var reloadViewWithCalled: Bool {
        return reloadViewWithCallsCount > 0
    }
    var reloadViewWithReceivedSections: [Section]?
    var reloadViewWithReceivedInvocations: [[Section]] = []
    var reloadViewWithClosure: (([Section]) -> Void)?

    func reloadViewWith(_ sections: [Section]) {
        reloadViewWithCallsCount += 1
        reloadViewWithReceivedSections = sections
        reloadViewWithReceivedInvocations.append(sections)
        reloadViewWithClosure?(sections)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class VisionBoardViewableMock: VisionBoardViewable {

    //MARK: - render

    var renderTitleTableDataSourceCallsCount = 0
    var renderTitleTableDataSourceCalled: Bool {
        return renderTitleTableDataSourceCallsCount > 0
    }
    var renderTitleTableDataSourceReceivedArguments: (title: String, tableDataSource: VisionBoardTableDataSourceProtocol)?
    var renderTitleTableDataSourceReceivedInvocations: [(title: String, tableDataSource: VisionBoardTableDataSourceProtocol)] = []
    var renderTitleTableDataSourceClosure: ((String, VisionBoardTableDataSourceProtocol) -> Void)?

    func render(title: String, tableDataSource: VisionBoardTableDataSourceProtocol) {
        renderTitleTableDataSourceCallsCount += 1
        renderTitleTableDataSourceReceivedArguments = (title: title, tableDataSource: tableDataSource)
        renderTitleTableDataSourceReceivedInvocations.append((title: title, tableDataSource: tableDataSource))
        renderTitleTableDataSourceClosure?(title, tableDataSource)
    }

}
