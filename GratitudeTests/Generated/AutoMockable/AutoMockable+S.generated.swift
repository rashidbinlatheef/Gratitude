// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionDetailsInteractingMock: SectionDetailsInteracting {

    //MARK: - handleAddPhotoButtonAction

    var handleAddPhotoButtonActionCallsCount = 0
    var handleAddPhotoButtonActionCalled: Bool {
        return handleAddPhotoButtonActionCallsCount > 0
    }
    var handleAddPhotoButtonActionClosure: (() -> Void)?

    func handleAddPhotoButtonAction() {
        handleAddPhotoButtonActionCallsCount += 1
        handleAddPhotoButtonActionClosure?()
    }

    //MARK: - handleDoneButtonAction

    var handleDoneButtonActionCallsCount = 0
    var handleDoneButtonActionCalled: Bool {
        return handleDoneButtonActionCallsCount > 0
    }
    var handleDoneButtonActionClosure: (() -> Void)?

    func handleDoneButtonAction() {
        handleDoneButtonActionCallsCount += 1
        handleDoneButtonActionClosure?()
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

class SectionDetailsPresentingMock: SectionDetailsPresenting {

    //MARK: - display

    var displaySectionImagesTableActionHandlerCallsCount = 0
    var displaySectionImagesTableActionHandlerCalled: Bool {
        return displaySectionImagesTableActionHandlerCallsCount > 0
    }
    var displaySectionImagesTableActionHandlerReceivedArguments: (section: Section, images: [ImagePickerItem], tableActionHandler: SectionDetailsTableActionHandler)?
    var displaySectionImagesTableActionHandlerReceivedInvocations: [(section: Section, images: [ImagePickerItem], tableActionHandler: SectionDetailsTableActionHandler)] = []
    var displaySectionImagesTableActionHandlerClosure: ((Section, [ImagePickerItem], SectionDetailsTableActionHandler) -> Void)?

    func display(section: Section, images: [ImagePickerItem], tableActionHandler: SectionDetailsTableActionHandler) {
        displaySectionImagesTableActionHandlerCallsCount += 1
        displaySectionImagesTableActionHandlerReceivedArguments = (section: section, images: images, tableActionHandler: tableActionHandler)
        displaySectionImagesTableActionHandlerReceivedInvocations.append((section: section, images: images, tableActionHandler: tableActionHandler))
        displaySectionImagesTableActionHandlerClosure?(section, images, tableActionHandler)
    }

    //MARK: - reloadListWith

    var reloadListWithCallsCount = 0
    var reloadListWithCalled: Bool {
        return reloadListWithCallsCount > 0
    }
    var reloadListWithReceivedImages: [ImagePickerItem]?
    var reloadListWithReceivedInvocations: [[ImagePickerItem]] = []
    var reloadListWithClosure: (([ImagePickerItem]) -> Void)?

    func reloadListWith(_ images: [ImagePickerItem]) {
        reloadListWithCallsCount += 1
        reloadListWithReceivedImages = images
        reloadListWithReceivedInvocations.append(images)
        reloadListWithClosure?(images)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionDetailsSceneDelegateMock: SectionDetailsSceneDelegate {

    //MARK: - didFinishUpdatingDetailsForSection

    var didFinishUpdatingDetailsForSectionImagesCallsCount = 0
    var didFinishUpdatingDetailsForSectionImagesCalled: Bool {
        return didFinishUpdatingDetailsForSectionImagesCallsCount > 0
    }
    var didFinishUpdatingDetailsForSectionImagesReceivedArguments: (section: Section, images: [ImagePickerItem])?
    var didFinishUpdatingDetailsForSectionImagesReceivedInvocations: [(section: Section, images: [ImagePickerItem])] = []
    var didFinishUpdatingDetailsForSectionImagesClosure: ((Section, [ImagePickerItem]) -> Void)?

    func didFinishUpdatingDetailsForSection(_ section: Section, images: [ImagePickerItem]) {
        didFinishUpdatingDetailsForSectionImagesCallsCount += 1
        didFinishUpdatingDetailsForSectionImagesReceivedArguments = (section: section, images: images)
        didFinishUpdatingDetailsForSectionImagesReceivedInvocations.append((section: section, images: images))
        didFinishUpdatingDetailsForSectionImagesClosure?(section, images)
    }

    //MARK: - goToAddPhotoFor

    var goToAddPhotoForCallsCount = 0
    var goToAddPhotoForCalled: Bool {
        return goToAddPhotoForCallsCount > 0
    }
    var goToAddPhotoForReceivedSection: Section?
    var goToAddPhotoForReceivedInvocations: [Section] = []
    var goToAddPhotoForClosure: ((Section) -> Void)?

    func goToAddPhotoFor(_ section: Section) {
        goToAddPhotoForCallsCount += 1
        goToAddPhotoForReceivedSection = section
        goToAddPhotoForReceivedInvocations.append(section)
        goToAddPhotoForClosure?(section)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionDetailsTableActionHandlerMock: SectionDetailsTableActionHandler {

    //MARK: - deleteButtonTappedFor

    var deleteButtonTappedForCallsCount = 0
    var deleteButtonTappedForCalled: Bool {
        return deleteButtonTappedForCallsCount > 0
    }
    var deleteButtonTappedForReceivedImage: ImagePickerItem?
    var deleteButtonTappedForReceivedInvocations: [ImagePickerItem] = []
    var deleteButtonTappedForClosure: ((ImagePickerItem) -> Void)?

    func deleteButtonTappedFor(_ image: ImagePickerItem) {
        deleteButtonTappedForCallsCount += 1
        deleteButtonTappedForReceivedImage = image
        deleteButtonTappedForReceivedInvocations.append(image)
        deleteButtonTappedForClosure?(image)
    }

    //MARK: - captionUpdatedFor

    var captionUpdatedForCaptionCallsCount = 0
    var captionUpdatedForCaptionCalled: Bool {
        return captionUpdatedForCaptionCallsCount > 0
    }
    var captionUpdatedForCaptionReceivedArguments: (image: ImagePickerItem, caption: String?)?
    var captionUpdatedForCaptionReceivedInvocations: [(image: ImagePickerItem, caption: String?)] = []
    var captionUpdatedForCaptionClosure: ((ImagePickerItem, String?) -> Void)?

    func captionUpdatedFor(_ image: ImagePickerItem, caption: String?) {
        captionUpdatedForCaptionCallsCount += 1
        captionUpdatedForCaptionReceivedArguments = (image: image, caption: caption)
        captionUpdatedForCaptionReceivedInvocations.append((image: image, caption: caption))
        captionUpdatedForCaptionClosure?(image, caption)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionDetailsTableDataSourceProtocolMock: SectionDetailsTableDataSourceProtocol {

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

    //MARK: - reloadWithImages

    var reloadWithImagesCallsCount = 0
    var reloadWithImagesCalled: Bool {
        return reloadWithImagesCallsCount > 0
    }
    var reloadWithImagesReceivedImage: [ImagePickerItem]?
    var reloadWithImagesReceivedInvocations: [[ImagePickerItem]] = []
    var reloadWithImagesClosure: (([ImagePickerItem]) -> Void)?

    func reloadWithImages(_ image: [ImagePickerItem]) {
        reloadWithImagesCallsCount += 1
        reloadWithImagesReceivedImage = image
        reloadWithImagesReceivedInvocations.append(image)
        reloadWithImagesClosure?(image)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionDetailsViewableMock: SectionDetailsViewable {

    //MARK: - render

    var renderTitleTableDataSourceCallsCount = 0
    var renderTitleTableDataSourceCalled: Bool {
        return renderTitleTableDataSourceCallsCount > 0
    }
    var renderTitleTableDataSourceReceivedArguments: (title: String, tableDataSource: SectionDetailsTableDataSourceProtocol)?
    var renderTitleTableDataSourceReceivedInvocations: [(title: String, tableDataSource: SectionDetailsTableDataSourceProtocol)] = []
    var renderTitleTableDataSourceClosure: ((String, SectionDetailsTableDataSourceProtocol) -> Void)?

    func render(title: String, tableDataSource: SectionDetailsTableDataSourceProtocol) {
        renderTitleTableDataSourceCallsCount += 1
        renderTitleTableDataSourceReceivedArguments = (title: title, tableDataSource: tableDataSource)
        renderTitleTableDataSourceReceivedInvocations.append((title: title, tableDataSource: tableDataSource))
        renderTitleTableDataSourceClosure?(title, tableDataSource)
    }

    //MARK: - showEmptyState

    var showEmptyStateCallsCount = 0
    var showEmptyStateCalled: Bool {
        return showEmptyStateCallsCount > 0
    }
    var showEmptyStateReceivedShow: Bool?
    var showEmptyStateReceivedInvocations: [Bool] = []
    var showEmptyStateClosure: ((Bool) -> Void)?

    func showEmptyState(_ show: Bool) {
        showEmptyStateCallsCount += 1
        showEmptyStateReceivedShow = show
        showEmptyStateReceivedInvocations.append(show)
        showEmptyStateClosure?(show)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionImageListActionHandlerMock: SectionImageListActionHandler {

    //MARK: - didSelectImage

    var didSelectImageCallsCount = 0
    var didSelectImageCalled: Bool {
        return didSelectImageCallsCount > 0
    }
    var didSelectImageReceivedImage: ImagePickerItem?
    var didSelectImageReceivedInvocations: [ImagePickerItem] = []
    var didSelectImageClosure: ((ImagePickerItem) -> Void)?

    func didSelectImage(_ image: ImagePickerItem) {
        didSelectImageCallsCount += 1
        didSelectImageReceivedImage = image
        didSelectImageReceivedInvocations.append(image)
        didSelectImageClosure?(image)
    }

    //MARK: - startPagingIfNeeded

    var startPagingIfNeededCallsCount = 0
    var startPagingIfNeededCalled: Bool {
        return startPagingIfNeededCallsCount > 0
    }
    var startPagingIfNeededClosure: (() -> Void)?

    func startPagingIfNeeded() {
        startPagingIfNeededCallsCount += 1
        startPagingIfNeededClosure?()
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionImageListDataSourceProtocolMock: SectionImageListDataSourceProtocol {

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

    //MARK: - reloadWithSelectedImages

    var reloadWithSelectedImagesCallsCount = 0
    var reloadWithSelectedImagesCalled: Bool {
        return reloadWithSelectedImagesCallsCount > 0
    }
    var reloadWithSelectedImagesReceivedSelectedImages: [ImagePickerItem]?
    var reloadWithSelectedImagesReceivedInvocations: [[ImagePickerItem]] = []
    var reloadWithSelectedImagesClosure: (([ImagePickerItem]) -> Void)?

    func reloadWithSelectedImages(_ selectedImages: [ImagePickerItem]) {
        reloadWithSelectedImagesCallsCount += 1
        reloadWithSelectedImagesReceivedSelectedImages = selectedImages
        reloadWithSelectedImagesReceivedInvocations.append(selectedImages)
        reloadWithSelectedImagesClosure?(selectedImages)
    }

    //MARK: - reloadWithImages

    var reloadWithImagesSelectedImagesCallsCount = 0
    var reloadWithImagesSelectedImagesCalled: Bool {
        return reloadWithImagesSelectedImagesCallsCount > 0
    }
    var reloadWithImagesSelectedImagesReceivedArguments: (images: [ImagePickerItem], selectedImages: [ImagePickerItem])?
    var reloadWithImagesSelectedImagesReceivedInvocations: [(images: [ImagePickerItem], selectedImages: [ImagePickerItem])] = []
    var reloadWithImagesSelectedImagesClosure: (([ImagePickerItem], [ImagePickerItem]) -> Void)?

    func reloadWithImages(_ images: [ImagePickerItem], selectedImages: [ImagePickerItem]) {
        reloadWithImagesSelectedImagesCallsCount += 1
        reloadWithImagesSelectedImagesReceivedArguments = (images: images, selectedImages: selectedImages)
        reloadWithImagesSelectedImagesReceivedInvocations.append((images: images, selectedImages: selectedImages))
        reloadWithImagesSelectedImagesClosure?(images, selectedImages)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionImageSelectorInteractingMock: SectionImageSelectorInteracting {

    //MARK: - continueWithImageSelection

    var continueWithImageSelectionCallsCount = 0
    var continueWithImageSelectionCalled: Bool {
        return continueWithImageSelectionCallsCount > 0
    }
    var continueWithImageSelectionClosure: (() -> Void)?

    func continueWithImageSelection() {
        continueWithImageSelectionCallsCount += 1
        continueWithImageSelectionClosure?()
    }

    //MARK: - searchImagesFor

    var searchImagesForSearchTextCallsCount = 0
    var searchImagesForSearchTextCalled: Bool {
        return searchImagesForSearchTextCallsCount > 0
    }
    var searchImagesForSearchTextReceivedSearchText: String?
    var searchImagesForSearchTextReceivedInvocations: [String?] = []
    var searchImagesForSearchTextClosure: ((String?) -> Void)?

    func searchImagesFor(searchText: String?) {
        searchImagesForSearchTextCallsCount += 1
        searchImagesForSearchTextReceivedSearchText = searchText
        searchImagesForSearchTextReceivedInvocations.append(searchText)
        searchImagesForSearchTextClosure?(searchText)
    }

    //MARK: - handleCameraButtonTap

    var handleCameraButtonTapCallsCount = 0
    var handleCameraButtonTapCalled: Bool {
        return handleCameraButtonTapCallsCount > 0
    }
    var handleCameraButtonTapClosure: (() -> Void)?

    func handleCameraButtonTap() {
        handleCameraButtonTapCallsCount += 1
        handleCameraButtonTapClosure?()
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

class SectionImageSelectorPresentingMock: SectionImageSelectorPresenting {

    //MARK: - display

    var displaySearchTextImagesSelectedImagesTableActionHandlerCallsCount = 0
    var displaySearchTextImagesSelectedImagesTableActionHandlerCalled: Bool {
        return displaySearchTextImagesSelectedImagesTableActionHandlerCallsCount > 0
    }
    var displaySearchTextImagesSelectedImagesTableActionHandlerReceivedArguments: (searchText: String?, images: [ImagePickerItem], selectedImages: [ImagePickerItem], tableActionHandler: SectionImageListActionHandler)?
    var displaySearchTextImagesSelectedImagesTableActionHandlerReceivedInvocations: [(searchText: String?, images: [ImagePickerItem], selectedImages: [ImagePickerItem], tableActionHandler: SectionImageListActionHandler)] = []
    var displaySearchTextImagesSelectedImagesTableActionHandlerClosure: ((String?, [ImagePickerItem], [ImagePickerItem], SectionImageListActionHandler) -> Void)?

    func display(searchText: String?, images: [ImagePickerItem], selectedImages: [ImagePickerItem], tableActionHandler: SectionImageListActionHandler) {
        displaySearchTextImagesSelectedImagesTableActionHandlerCallsCount += 1
        displaySearchTextImagesSelectedImagesTableActionHandlerReceivedArguments = (searchText: searchText, images: images, selectedImages: selectedImages, tableActionHandler: tableActionHandler)
        displaySearchTextImagesSelectedImagesTableActionHandlerReceivedInvocations.append((searchText: searchText, images: images, selectedImages: selectedImages, tableActionHandler: tableActionHandler))
        displaySearchTextImagesSelectedImagesTableActionHandlerClosure?(searchText, images, selectedImages, tableActionHandler)
    }

    //MARK: - reloadListWithImages

    var reloadListWithImagesSelectedImagesCallsCount = 0
    var reloadListWithImagesSelectedImagesCalled: Bool {
        return reloadListWithImagesSelectedImagesCallsCount > 0
    }
    var reloadListWithImagesSelectedImagesReceivedArguments: (images: [ImagePickerItem], selectedImages: [ImagePickerItem])?
    var reloadListWithImagesSelectedImagesReceivedInvocations: [(images: [ImagePickerItem], selectedImages: [ImagePickerItem])] = []
    var reloadListWithImagesSelectedImagesClosure: (([ImagePickerItem], [ImagePickerItem]) -> Void)?

    func reloadListWithImages(_ images: [ImagePickerItem], selectedImages: [ImagePickerItem]) {
        reloadListWithImagesSelectedImagesCallsCount += 1
        reloadListWithImagesSelectedImagesReceivedArguments = (images: images, selectedImages: selectedImages)
        reloadListWithImagesSelectedImagesReceivedInvocations.append((images: images, selectedImages: selectedImages))
        reloadListWithImagesSelectedImagesClosure?(images, selectedImages)
    }

    //MARK: - didUpdateImageSelection

    var didUpdateImageSelectionCallsCount = 0
    var didUpdateImageSelectionCalled: Bool {
        return didUpdateImageSelectionCallsCount > 0
    }
    var didUpdateImageSelectionReceivedSelectedImages: [ImagePickerItem]?
    var didUpdateImageSelectionReceivedInvocations: [[ImagePickerItem]] = []
    var didUpdateImageSelectionClosure: (([ImagePickerItem]) -> Void)?

    func didUpdateImageSelection(_ selectedImages: [ImagePickerItem]) {
        didUpdateImageSelectionCallsCount += 1
        didUpdateImageSelectionReceivedSelectedImages = selectedImages
        didUpdateImageSelectionReceivedInvocations.append(selectedImages)
        didUpdateImageSelectionClosure?(selectedImages)
    }

    //MARK: - showImageLimitBanner

    var showImageLimitBannerCallsCount = 0
    var showImageLimitBannerCalled: Bool {
        return showImageLimitBannerCallsCount > 0
    }
    var showImageLimitBannerReceivedShow: Bool?
    var showImageLimitBannerReceivedInvocations: [Bool] = []
    var showImageLimitBannerClosure: ((Bool) -> Void)?

    func showImageLimitBanner(_ show: Bool) {
        showImageLimitBannerCallsCount += 1
        showImageLimitBannerReceivedShow = show
        showImageLimitBannerReceivedInvocations.append(show)
        showImageLimitBannerClosure?(show)
    }

    //MARK: - showNetworkProgressIndicator

    var showNetworkProgressIndicatorCallsCount = 0
    var showNetworkProgressIndicatorCalled: Bool {
        return showNetworkProgressIndicatorCallsCount > 0
    }
    var showNetworkProgressIndicatorReceivedShow: Bool?
    var showNetworkProgressIndicatorReceivedInvocations: [Bool] = []
    var showNetworkProgressIndicatorClosure: ((Bool) -> Void)?

    func showNetworkProgressIndicator(_ show: Bool) {
        showNetworkProgressIndicatorCallsCount += 1
        showNetworkProgressIndicatorReceivedShow = show
        showNetworkProgressIndicatorReceivedInvocations.append(show)
        showNetworkProgressIndicatorClosure?(show)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionImageSelectorSceneDelegateMock: SectionImageSelectorSceneDelegate {

    //MARK: - didContinueWithSelectedImages

    var didContinueWithSelectedImagesSectionCallsCount = 0
    var didContinueWithSelectedImagesSectionCalled: Bool {
        return didContinueWithSelectedImagesSectionCallsCount > 0
    }
    var didContinueWithSelectedImagesSectionReceivedArguments: (images: [ImagePickerItem], section: Section)?
    var didContinueWithSelectedImagesSectionReceivedInvocations: [(images: [ImagePickerItem], section: Section)] = []
    var didContinueWithSelectedImagesSectionClosure: (([ImagePickerItem], Section) -> Void)?

    func didContinueWithSelectedImages(_ images: [ImagePickerItem], section: Section) {
        didContinueWithSelectedImagesSectionCallsCount += 1
        didContinueWithSelectedImagesSectionReceivedArguments = (images: images, section: section)
        didContinueWithSelectedImagesSectionReceivedInvocations.append((images: images, section: section))
        didContinueWithSelectedImagesSectionClosure?(images, section)
    }

    //MARK: - showImagePicker

    var showImagePickerDelegateCallsCount = 0
    var showImagePickerDelegateCalled: Bool {
        return showImagePickerDelegateCallsCount > 0
    }
    var showImagePickerDelegateReceivedDelegate: ImagePickerDelegate?
    var showImagePickerDelegateReceivedInvocations: [ImagePickerDelegate] = []
    var showImagePickerDelegateClosure: ((ImagePickerDelegate) -> Void)?

    func showImagePicker(delegate: ImagePickerDelegate) {
        showImagePickerDelegateCallsCount += 1
        showImagePickerDelegateReceivedDelegate = delegate
        showImagePickerDelegateReceivedInvocations.append(delegate)
        showImagePickerDelegateClosure?(delegate)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionImageSelectorViewableMock: SectionImageSelectorViewable {

    //MARK: - render

    var renderSearchTextListDataSourceCallsCount = 0
    var renderSearchTextListDataSourceCalled: Bool {
        return renderSearchTextListDataSourceCallsCount > 0
    }
    var renderSearchTextListDataSourceReceivedArguments: (searchText: String?, listDataSource: SectionImageListDataSourceProtocol)?
    var renderSearchTextListDataSourceReceivedInvocations: [(searchText: String?, listDataSource: SectionImageListDataSourceProtocol)] = []
    var renderSearchTextListDataSourceClosure: ((String?, SectionImageListDataSourceProtocol) -> Void)?

    func render(searchText: String?, listDataSource: SectionImageListDataSourceProtocol) {
        renderSearchTextListDataSourceCallsCount += 1
        renderSearchTextListDataSourceReceivedArguments = (searchText: searchText, listDataSource: listDataSource)
        renderSearchTextListDataSourceReceivedInvocations.append((searchText: searchText, listDataSource: listDataSource))
        renderSearchTextListDataSourceClosure?(searchText, listDataSource)
    }

    //MARK: - showSelectedImages

    var showSelectedImagesCallsCount = 0
    var showSelectedImagesCalled: Bool {
        return showSelectedImagesCallsCount > 0
    }
    var showSelectedImagesReceivedImages: [ImagePickerItem]?
    var showSelectedImagesReceivedInvocations: [[ImagePickerItem]] = []
    var showSelectedImagesClosure: (([ImagePickerItem]) -> Void)?

    func showSelectedImages(_ images: [ImagePickerItem]) {
        showSelectedImagesCallsCount += 1
        showSelectedImagesReceivedImages = images
        showSelectedImagesReceivedInvocations.append(images)
        showSelectedImagesClosure?(images)
    }

    //MARK: - showImageLimitBanner

    var showImageLimitBannerCallsCount = 0
    var showImageLimitBannerCalled: Bool {
        return showImageLimitBannerCallsCount > 0
    }
    var showImageLimitBannerReceivedShow: Bool?
    var showImageLimitBannerReceivedInvocations: [Bool] = []
    var showImageLimitBannerClosure: ((Bool) -> Void)?

    func showImageLimitBanner(_ show: Bool) {
        showImageLimitBannerCallsCount += 1
        showImageLimitBannerReceivedShow = show
        showImageLimitBannerReceivedInvocations.append(show)
        showImageLimitBannerClosure?(show)
    }

    //MARK: - showNetworkProgressIndicator

    var showNetworkProgressIndicatorCallsCount = 0
    var showNetworkProgressIndicatorCalled: Bool {
        return showNetworkProgressIndicatorCallsCount > 0
    }
    var showNetworkProgressIndicatorReceivedShow: Bool?
    var showNetworkProgressIndicatorReceivedInvocations: [Bool] = []
    var showNetworkProgressIndicatorClosure: ((Bool) -> Void)?

    func showNetworkProgressIndicator(_ show: Bool) {
        showNetworkProgressIndicatorCallsCount += 1
        showNetworkProgressIndicatorReceivedShow = show
        showNetworkProgressIndicatorReceivedInvocations.append(show)
        showNetworkProgressIndicatorClosure?(show)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionNameInputInteractingMock: SectionNameInputInteracting {

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

class SectionNameInputPresentingMock: SectionNameInputPresenting {

    //MARK: - showSectionPickerItems

    var showSectionPickerItemsCallsCount = 0
    var showSectionPickerItemsCalled: Bool {
        return showSectionPickerItemsCallsCount > 0
    }
    var showSectionPickerItemsReceivedItemTitles: [String]?
    var showSectionPickerItemsReceivedInvocations: [[String]] = []
    var showSectionPickerItemsClosure: (([String]) -> Void)?

    func showSectionPickerItems(_ itemTitles: [String]) {
        showSectionPickerItemsCallsCount += 1
        showSectionPickerItemsReceivedItemTitles = itemTitles
        showSectionPickerItemsReceivedInvocations.append(itemTitles)
        showSectionPickerItemsClosure?(itemTitles)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionNameInputSceneDelegateMock: SectionNameInputSceneDelegate {

    //MARK: - continueWithSectionName

    var continueWithSectionNameCallsCount = 0
    var continueWithSectionNameCalled: Bool {
        return continueWithSectionNameCallsCount > 0
    }
    var continueWithSectionNameReceivedName: String?
    var continueWithSectionNameReceivedInvocations: [String] = []
    var continueWithSectionNameClosure: ((String) -> Void)?

    func continueWithSectionName(_ name: String) {
        continueWithSectionNameCallsCount += 1
        continueWithSectionNameReceivedName = name
        continueWithSectionNameReceivedInvocations.append(name)
        continueWithSectionNameClosure?(name)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class SectionNameInputViewableMock: SectionNameInputViewable {

    //MARK: - loadSectionNamePickerTitles

    var loadSectionNamePickerTitlesCallsCount = 0
    var loadSectionNamePickerTitlesCalled: Bool {
        return loadSectionNamePickerTitlesCallsCount > 0
    }
    var loadSectionNamePickerTitlesReceivedTitles: [String]?
    var loadSectionNamePickerTitlesReceivedInvocations: [[String]] = []
    var loadSectionNamePickerTitlesClosure: (([String]) -> Void)?

    func loadSectionNamePickerTitles(_ titles: [String]) {
        loadSectionNamePickerTitlesCallsCount += 1
        loadSectionNamePickerTitlesReceivedTitles = titles
        loadSectionNamePickerTitlesReceivedInvocations.append(titles)
        loadSectionNamePickerTitlesClosure?(titles)
    }

}
